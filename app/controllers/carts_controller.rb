# Carts for customers who are buying a product
# frozen_string_literal: true

class CartsController < ApplicationController
  skip_after_action :verify_authorized, only: :thanks
  before_action :cart_find, only: %i[show create update update_shipping_price]

  def show
    # Get cart_plants to be shown in cart
    @cart_plants = @cart.cart_plants

    # Sum them up and show the total bill
    @total_bill = []
    @cart.cart_plants.each do |cart_plant|
      @total_bill << (cart_plant.plant.price * cart_plant.amount)
    end
    @cart.amount = @total_bill.sum.to_i * 100

    # Authorize if user is the same that created it
    authorize @cart
    @cart.save
  end

  def update
    authorize @cart
    @cart.status = 'closed'
    @cart.save ? (redirect_to cart_path(@cart)) : (render :show)
  end

  def thanks
    @cart = policy_scope(Cart).where(user: current_user).find(params[:cart_id])
    sleep(3)
    if @cart.state == 'paid'
      CartMailer.with(cart: @cart).payment_confirmation(@cart).deliver_now
    end
  end

  private

  def cart_find
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params
      .require(:cart)
      .permit(:user_id, :state, :amount, :checkout_session_id, :plant_sku)
  end
end
