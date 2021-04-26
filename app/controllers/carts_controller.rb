# Carts for customers who are buying a product
# frozen_string_literal: true

class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show comment_cart]
  skip_after_action :verify_authorized, only: :thanks

  def show
    @cart_plants = @cart.cart_plants.includes(:plant).order(Arel.sql('plants.name'))
    @total_bill = @cart.cart_plants.map do |cart_plant|
      cart_plant.plant.price * cart_plant.amount
    end
    authorize @cart
    @cart.amount = @total_bill.sum.to_i * 100
    @cart.save
  end

  def thanks
    CartMailer.with(cart: @cart).payment_confirmation(@cart).deliver_now if @cart.state == 'paid'
  end

  private

  def cart_params
    params
      .require(:cart)
      .permit(:user_id, :state, :amount, :comment, :checkout_session_id, :plant_sku)
  end
end
