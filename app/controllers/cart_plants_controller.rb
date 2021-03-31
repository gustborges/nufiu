class CartPlantsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :cart_plants_find, only: [:edit, :destroy]

  def create
    # If there's no opened cart, create it
    if Cart.find_by(user_id: current_user.id).nil? || current_user.carts.last.status == "closed"
      @cart = Cart.new
      @cart.user = current_user
      @cart.save
    else
      @cart = current_user.carts.last
    end

    @existing_cart_plant = @cart.cart_plants.find_by(plant_id: params[:plant_id]) # Check if the plant is already in one of the card plants

    if @existing_cart_plant # If plant is already there, just add 1
      @existing_cart_plant.amount += 1
      authorize @existing_cart_plant
      @existing_cart_plant.save ? (redirect_to cart_path(@cart)) : (redirect_to plant_path(@cart_plant.plant))

    else
      @cart_plant = CartPlant.new # If not, create a new cart_plant
      @cart_plant.cart = @cart
      @cart_plant.plant_id = params[:plant_id]
      @cart_plant.amount = 1
      authorize @cart_plant
      @cart_plant.save ? (redirect_to cart_path(@cart)) : (redirect_to plant_path(@cart_plant.plant))
    end
  end

  def edit; end

  def update
    @cart_plant = policy_scope(CartPlant).each do |cart_plant|
      cart_plant.plant.id = params[:plant_id]
    end
    @cart_plant = @cart_plant.first
    if params[:plant_id] == "reduce" # don't know how to do it
      @cart_plant.amount -= 1
    elsif params[:plant_id] == "add" # don't know how to do it
      @cart_plant.amount += 1
    end
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
