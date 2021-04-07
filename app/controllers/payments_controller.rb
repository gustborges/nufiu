class PaymentsController < ApplicationController

  def new
    @cart = policy_scope(Cart).where(user: current_user).find(params[:cart_id])
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Suas Compras",
        amount: @cart.amount,
        currency: 'brl',
        quantity: 1
      }],
      mode: 'payment',
      success_url: cart_thanks_url,
      cancel_url: cart_url(@cart.id)
    )
    @cart.update(checkout_session_id: session.id)
    authorize @cart
  end
end
