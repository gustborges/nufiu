class OrdersController < ApplicationController
  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    @cart = Cart.find(params[:cart_id])
    price_cents = @cart.total * 100
    @order = policy_scope(Order).create(cart_id: @cart.id, amount: price_cents, state: 'pending', user: current_user)
    authorize @order
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Suas compras",
        # images: [cart.plant.photo],
        amount: price_cents,
        currency: 'brl',
        quantity: 1 # add cart.total_amount
      }],
      mode: 'payment',
      success_url: cart_order_url(@cart, @order),
      cancel_url: cart_order_url(@cart, @order)
    )

    @order.update(checkout_session_id: session.id)
    redirect_to new_cart_order_payment_path(@cart, @order)
  end
end
