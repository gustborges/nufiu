# Preview all emails at http://localhost:3000/rails/mailers/cart_mailer
class CartMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/cart_mailer/payment_confirmation

  def payment_confirmation
    @user = User.find_by(email: 'gustborges@gmail.com')
    @cart = @user.carts.last
    CartMailer.payment_confirmation(@cart)
  end
end
