class StripeCheckoutSessionService

  def call(event)
    cart = Cart.where(user: current_user).find_by(checkout_session_id: event.data.object.id)
    cart.update(state: 'paid')
  end
end