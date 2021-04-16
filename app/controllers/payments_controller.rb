class PaymentsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @cart = policy_scope(Cart).where(user: current_user).find(params[:cart_id])
    @user = current_user
    if @user.shipping.nil?
      @user.suburb.nil? ? @suburb = Suburb.first : @suburb = @user.suburb
      @shipping = Shipping.create!(suburb: @suburb, user: @user, address: @user.address, address_complement: @user.address_complement, zip_code: @user.zip_code, location_details: @user.location_details)
      authorize @shipping
      @shipping.save
    else
      @shipping = current_user.shipping
    end

    @shipping_price = @shipping.pick_up ? 0 : (@user.shipping.suburb.shipping_price * 100)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Suas Compras",
        amount: @cart.amount + @shipping_price,
        currency: 'brl',
        quantity: 1
      }],
      mode: 'payment',
      success_url: cart_obrigada_url(@cart.id),
      cancel_url: cart_url(@cart.id)
    )
    @cart.update(checkout_session_id: session.id)
    authorize @cart
  end
end
