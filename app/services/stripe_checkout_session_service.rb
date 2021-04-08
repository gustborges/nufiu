class StripeCheckoutSessionService

  def call(event)
    cart = policy_scope(Cart).find_by(checkout_session_id: event.data.object.id)
    authorize cart
    cart.update(state: 'paid')
  end
end