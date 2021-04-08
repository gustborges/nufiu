class StripeCheckoutSessionService
  skip_after_action :verify_authorized
  skip_before_action :authenticate_user!

  def call(event)
    cart = policy_scope(Cart).find_by(checkout_session_id: event.data.object.id)
    cart.update(state: 'paid')
  end
end