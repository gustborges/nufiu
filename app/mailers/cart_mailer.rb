class CartMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.cart_mailer.payment_confirmation.subject
  #

  def payment_confirmation(cart_id)
    @cart = Cart.find(cart_id)
    @user = @cart.user

    mail(to: @user.email, subject: 'Recebemos o seu pagamento', cc: 'segrobmalu@gmail.com')
  end

  def confirmation_for_workshop(cart_id)
    @cart = Cart.find(cart_id)
    @user = @cart.user

    mail(to: @user.email, subject: 'Recebemos o seu pagamento', cc: 'segrobmalu@gmail.com')
  end

  def confirmation_for_workshop_and_others(cart_id)
    @cart = Cart.find(cart_id)
    @user = @cart.user

    mail(to: @user.email, subject: 'Recebemos o seu pagamento', cc: 'segrobmalu@gmail.com')
  end
end
