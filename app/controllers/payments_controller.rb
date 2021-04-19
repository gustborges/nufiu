class PaymentsController < ApplicationController
  def new
    transfer_guest_cart_to_user
    set_shipping_address_and_price
    go_to_payment
  end

  def set_shipping_address_and_price
    @user = current_user
    if @user.shipping.nil?
      @suburb = @user.suburb
      @shipping =
        Shipping.create!(
          suburb: @suburb,
          user: @user,
          address: @user.address,
          address_complement: @user.address_complement,
          zip_code: @user.zip_code,
          location_details: @user.location_details,
          pick_up: false
        )
    else
      @shipping = current_user.shipping
    end
    authorize @shipping
    @shipping.save

    @shipping_price =
      @shipping.pick_up || @shipping.suburb.nil? ? 0 : (@user.shipping.suburb.shipping_price * 100)
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
      # CartPlant.where(cart_id: guest_cart.id).delete_all
      # guest_cart.destroy
      # session[:cart] = nil
    end
  end

  def go_to_payment
    session =
      Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [
          {
            name: 'Suas Compras',
            amount: @cart.amount + @shipping_price,
            currency: 'brl',
            quantity: 1
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
