class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :cart_find, only: [:show, :update]

  def index
    @carts = current_user.carts
    authorize @cart
  end

  def show
    # Get cart_plants to be shown in cart
    @cart_plants = @cart.cart_plants

    # Authorize if user is the same that created it
    authorize @cart

    # Get products that will be shown and summed up
    products = CartPlant.where(cart: @cart)

    # Sum them up and show the total bill
    @cart_products = products.group_by { |product| product.plant.id}
    @total_bill = []
    products.each do |product|
       @total_bill << product.plant.price
    end
    @total_bill = @total_bill.sum

  end

  def update
    # Authorize if user is the same that created
    authorize @cart

    # We will update it to "closed" when user pays, so no carts will need to be destroyed
    @cart.status = "closed"
    if @cart.save
      redirect_to cart_path(@cart)
    else
      render :show
    end
  end

  private

  def cart_find
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:user_id, :status)
  end
end
