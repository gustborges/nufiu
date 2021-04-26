class StripeCheckoutSessionService
  def call(event)
    cart = Cart.find_by(checkout_session_id: event.data.object.id)
    cart.state = 'paid'
    cart.save
  end
end
