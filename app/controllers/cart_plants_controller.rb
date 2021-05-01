# frozen_string_literal: true

class CartPlantsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @existing_cart_plant = @cart.cart_plants.find_by(plant_id: params[:plant_id])

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

  def update
    @cart_plant = @cart.cart_plants.find_by(plant_id: params[:plant_id])

    if params[:fix_amount] == 'reduce'
      @cart_plant.amount -= 1 if @cart_plant.amount > 0
    elsif params[:fix_amount] == 'add'
      @cart_plant.amount += 1
    end
    @cart_plant.destroy if @cart_plant.amount == 0
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
    @cart = Cart.find(params[:cart_id])
    @cart_plant = CartPlant.find(cart_plant_params)
    redirect_to cart_path(@cart) if @cart_plant.destroy
  end

  def delete_all
    @cart.cart_plants.destroy_all
    authorize @cart
    respond_to do |format|
      format.html { redirect_to cart_path(params[:cart_id]) }
      format.json { head :no_content }
    end
  end

  private

  def cart_plants_params
    params.require(:cart_plant).permit(:plant_id, :amount)
  end
end
