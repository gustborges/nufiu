# frozen_string_literal: true

class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def new
    if current_user.nil?
      authenticate_user!
      transfer_guest_cart_to_user
    end
    set_shipping_address_and_price
    @cart.user = current_user
    @cart.save
    go_to_payment

    # Sending information to Segment.io
    if user_signed_in?
      Analytics.track(
        user_id: current_user.id,
        event: 'Conferindo pedido',
        properties: {
          name: current_user.name,
          email: current_user.email,
          cart: @cart.id,
          amount: @cart.amount / 100,
          step: 3
        }
      )
    end
  end

  def set_shipping_address_and_price
    @shipping = if current_user.shipping.nil?
                  Shipping.create!(
                    suburb: current_user.suburb,
                    user: current_user,
                    address: current_user.address,
                    address_complement: current_user.address_complement,
                    zip_code: current_user.zip_code,
                    location_details: current_user.location_details,
                    pick_up: false,
                  )
                else
                  current_user.shipping
                end
    authorize @shipping
    @shipping.save
    if @cart.cart_plants.count == 1 && @cart.cart_plants.last.plant.name == 'Workshop Online de Kokedamas'
      @online_workshop = true
      @shipping_price = 0
    else
      @online_workshop = false
      @shipping_price =
        @shipping.pick_up || @shipping.suburb.nil? ? 0 : (current_user.shipping.suburb.shipping_price * 100)
    end
  end

  def transfer_guest_cart_to_user
    if session[:cart]
      guest_cart = Cart.find(session[:cart])
      guest_cart.cart_plants.each do |cart_plant|
        CartPlant.create(
          cart_id: session[:cart_id],
          plant_id: cart_plant.plant,
          amount: cart_plant.amount
        )
      end
      guest_cart.user_id = current_user.id
      guest_cart.save
    end
  end

  def go_to_payment
    details = @cart.cart_plants.map { |cp| " #{cp.amount} x #{cp.plant.name} (R$#{cp.plant.price}/cada)" }
    session =
      Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [
          {
            name: 'Suas Compras',
            amount: @cart.amount + @shipping_price,
            currency: 'brl',
            quantity: 1,
            description: details.join(',')
          }
        ],
        mode: 'payment',
        success_url: cart_obrigada_url(@cart.id),
        cancel_url: cart_url(@cart.id)
      )
    @cart.update(checkout_session_id: session.id)
    authorize @cart
  end
end
