class CartMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.cart_mailer.payment_confirmation.subject
  #

  def payment_confirmation(cart)
    @cart = cart
    @user = @cart.user

    mail(to: @user.email, subject: 'Recebemos o seu pagamento', cc: 'segrobmalu@gmail.com')
  end

  def workshop_payment_confirmation(cart)
    @cart = cart
    @user = @cart.user

    mail(to: @user.email, subject: 'Recebemos o seu pagamento', cc: 'segrobmalu@gmail.com')
  end
end
