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

    # Sending information to Segment.io
    if user_signed_in?
      Analytics.track(
        user_id: current_user.id,
        event: 'Visualizou cesta',
        properties: {
          name: current_user.name,
          email: current_user.email,
          cart_id: @cart.id,
          amount: @cart.amount / 100,
          step: 2
        }
      )
    end
  end

  def thanks
    # Sending confirmation mail to user
    @cart_has_any_workshop = @cart.cart_plants.any?(&:workshop?)
    @cart_has_only_workshop = @cart.cart_plants.all?(&:workshop?)
    # if @cart.state == 'paid'
    if @cart_has_only_workshop
      CartMailer.with(cart: @cart).confirmation_for_workshop(@cart).deliver_now
    elsif @cart_has_any_workshop
      CartMailer.with(cart: @cart).confirmation_for_workshop_and_others(@cart).deliver_now
    else
      CartMailer.with(cart: @cart).payment_confirmation(@cart).deliver_now
    end
    # end

    # Sending information to Segment.io
    details = @cart.cart_plants.map { |cp| " #{cp.amount} x #{cp.plant.name} (R$#{cp.plant.price}/cada)" }
    @user = @cart.user
    if user_signed_in?
      Analytics.track(
        user_id: @user.id,
        event: 'Obrigada pela compra',
        properties: {
          details: details,
          name: @user.name,
          email: @user.email,
          cart: @cart.id,
          amount: @cart.amount / 100,
          shipping_price: @user.shipping.pick_up ? 0 : @user.shipping.suburb.shipping_price,
          pick_up: @user.shipping.pick_up,
          shipping_location: @user.shipping.suburb.name || @user.suburb.name,
          step: 4
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
