Rails.application.config.session_store :cookie_store, {
  key: 'cart',
  expire_after: 1.days
}
