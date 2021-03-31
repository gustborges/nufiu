class CartPlantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :cart_plants_find, only: [:edit, :destroy]

  def create
    # If there's no opened cart, create it
    if Cart.find_by(user_id: current_user.id).nil? || current_user.carts.last.status == "closed" || current_user.carts.last.status == "clean"
      @cart = Cart.new
      @cart.user = current_user
      @cart.save
    else
      @cart = current_user.carts.last
    end

    # Then, create the cart_plant, within a cart and with a plant and amount
    @cart_plant = CartPlant.new
    @cart_plant.cart = @cart
    @cart_plant.plant_id = params[:plant_id]
    @cart_plant.amount = 1
    authorize @cart_plant

    # Save and go to the cart
    if @cart_plant.save
      redirect_to cart_path(@cart)
    else
      redirect_to plant_path(@cart_plant.plant)
    end
  end


  def edit; end

  def update
    @cart_plant = CartPlant.find_by(plant: params[:plant_id])
    @cart_plant.amount += 1
    authorize @cart_plant
    @cart_plant.save
    redirect_to cart_path(@cart_plant.cart)
  end

  def destroy
    @cart_plant.destroy
    redirect_to cart_path(@cart_plant.cart)
  end


  private

  def cart_plants_find
    @cart_plant = CartPlant.find(params[:id])
  end


  def cart_plants_params
    params.require(:cart_plant).permit(:plant_id)
  end


end
