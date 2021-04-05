class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :cart_find, only: [:show, :update]

  def index
    @carts = current_user.carts
    authorize @carts
  end

  def show
    # Get cart_plants to be shown in cart
    @cart_plants = @cart.cart_plants

    if params[:empty_cart]
      @cart_plants.each do |cart_plant|
        cart_plant.destroy
      end
      redirect_to cart_path(@cart)
    end
    # Authorize if user is the same that created it
    authorize @cart

    # Get products that will be shown and summed up
    products = CartPlant.where(cart: @cart)

    # @cart_products == @cart_plants but grouped by product
    @cart_products = products.group_by { |product| product.plant.id}

    # Sum them up and show the total bill
    @total_bill = []
    products.each do |product|
       @total_bill << product.plant.price
    end
    @total_bill = @total_bill.sum
    @cart.total = @total_bill
    @cart.save
  end

  def update
    # Authorize if user is the same that created
    authorize @cart

    # If user clicks in "Esvaziar carrinho", deletar todas as cart_plants, senão apenas modificar o status de cart para "closed"
      @cart.status = "closed"
      @cart.save ? (redirect_to cart_path(@cart)) : (render :show)
  end

  private

  def cart_find
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:user_id, :status)
  end
end
