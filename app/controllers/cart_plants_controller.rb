class CartPlantsController < ApplicationController
  before_action :cart_plants_find, only: %i[edit destroy]

  def create
    plant = policy_scope(Plant).find(params[:plant_id])

    # If there's no opened cart, create it
    if Cart.find_by(user_id: current_user.id).nil? || current_user.carts.last.state == 'closed'
      @cart = Cart.new(user: current_user, state: 'pending', amount: plant.price)
      authorize @cart
    else
      @cart = current_user.carts.last
    end
    @cart.save

    # If cart_plant exists, add 1. If not, create another one.
    @existing_cart_plant =
      @cart.cart_plants.find_by(plant_id: params[:plant_id])

    if @existing_cart_plant
      @existing_cart_plant.amount += 1
      authorize @existing_cart_plant
      @existing_cart_plant.save
    else
      @cart_plant =
        CartPlant.new(cart: @cart, plant_id: params[:plant_id], amount: 1)
      authorize @cart_plant
      @cart_plant.save
    end
    if @cart.save
      redirect_to cart_path(@cart)
    else
      redirect_to plant_path(params[:plant_id])
    end
  end

  def edit; end

  def update
    @cart = Cart.find(params[:id])
    @cart_plant = @cart.cart_plants.find_by(plant_id: params[:plant_id])

    if params[:fix_amount] == 'reduce'
      # don't know how to do it
      @cart_plant.amount -= 1 if @cart_plant.amount > 0
    elsif params[:fix_amount] == 'add'
      # don't know how to do it
      @cart_plant.amount += 1
    end
    authorize @cart_plant
    @cart_plant.save

    # Update total amount
    @total_bill = []
    @cart.cart_plants.each do |cart_plant|
      @total_bill << (cart_plant.plant.price * cart_plant.amount)
    end
    @cart.amount = @total_bill.sum.to_i
    @cart.save
    redirect_to cart_path(@cart_plant.cart)
  end

  def destroy
    @cart_plant.destroy
    redirect_to cart_path(@cart_plant.cart)
  end

  def delete_all
    cart = Cart.find(params[:cart_id])
    authorize cart
    cart.cart_plants.destroy_all
    respond_to do |format|
      format.html { redirect_to cart_path(params[:cart_id]) }
      format.json { head :no_content }
    end
  end

  private

  def cart_plants_find
    @cart_plant = CartPlant.find(params[:id])
  end

  def cart_plants_params
    params.require(:cart_plant).permit(:plant_id)
  end
end
