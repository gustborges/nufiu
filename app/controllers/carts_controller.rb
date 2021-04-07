class CartsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  skip_after_action :verify_authorized, only: :thanks
  before_action :cart_find, only: [:show, :create, :update]

  def show
    # Get cart_plants to be shown in cart
    @cart_plants = @cart.cart_plants

    # Button: Esvaziar carrinho
    if params[:empty_cart]
      @cart_plants.each do |cart_plant|
        cart_plant.destroy
      end
      redirect_to cart_path(@cart)
    end

    # Sum them up and show the total bill
    @total_bill = []
    @cart.cart_plants.each do |cart_plant|
       @total_bill << (cart_plant.plant.price * cart_plant.amount)
    end
    @cart.amount = @total_bill.sum.to_i * 100
    
    # Authorize if user is the same that created it
    authorize @cart
    @cart.save
  end

  def update
    # Authorize if user is the same that created
    authorize @cart

    # If user clicks in "Esvaziar carrinho", deletar todas as cart_plants, senão apenas modificar o status de cart para "closed"
      @cart.status = "closed"
      @cart.save ? (redirect_to cart_path(@cart)) : (render :show)
  end

  def thanks; end

  private

  def cart_find
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:user_id, :state, :amount, :checkout_session_id, :plant_sku)
  end
end
