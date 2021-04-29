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
    if user_signed_in?
      Analytics.track(
        user_id: current_user.id,
        event: 'Visualizou cesta',
        properties: {
          name: current_user.name,
          email: current_user.email,
          cart_id: @cart.id,
          amount: @cart.amount / 100
        }
      )
    end
  end

  def thanks
    CartMailer.with(cart: @cart).payment_confirmation(@cart).deliver_now if @cart.state == 'paid'
    details = @cart.cart_plants.map { |cp| " #{cp.amount} x #{cp.plant.name} (R$#{cp.plant.price}/cada)" }
    if user_signed_in?
      Analytics.track(
        user_id: current_user.id,
        event: 'Obrigada pela compra',
        properties: {
          details: details,
          name: current_user.name,
          email: current_user.email,
          cart: @cart.id,
          amount: @cart.amount / 100,
          shipping_price: current_user.shipping.pick_up ? 0 : current_user.shipping.suburb.shipping_price,
          pick_up: current_user.shipping.pick_up,
          shipping_location: current_user.shipping.suburb.name || current_user.suburb.name
        }
      )
    end
  end

  private

  def cart_params
    params
      .require(:cart)
      .permit(:user_id, :state, :amount, :comment, :checkout_session_id, :plant_sku)
  end
end
