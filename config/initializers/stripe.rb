# config/initializers/stripe.rb
Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'] || Rails.application.credentials.stripe[:publishable_key],
  secret_key: ENV['STRIPE_SECRET_KEY'] || Rails.application.credentials.stripe[:secret_key],
  signing_secret: ENV['STRIPE_WEBHOOK_SECRET_KEY'] || Rails.application.credentials.stripe[:signing_secret]
}

Stripe.api_key = ENV['STRIPE_SECRET_KEY'] || Rails.application.credentials.stripe[:secret_key]
StripeEvent.signing_secret = ENV['STRIPE_WEBHOOK_SECRET_KEY'] || Rails.application.credentials.stripe[:signing_secret]

StripeEvent.configure do |events|
  events.subscribe 'checkout.session.completed',
                   StripeCheckoutSessionService.new
end
