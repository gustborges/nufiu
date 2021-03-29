class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :plant_find, only: [:show, :edit, :update, :destroy]

  def index
    @pet_friendly = params[:filter_pet_friendly] == "1" ? true : false
    # @sun = params[:filter_by_sun] ? true : false
    # @water = params[:filter_by_water] ? true : false
    if params[:filter_by_sun] && params[:filter_pet_friendly]
      @plants = policy_scope(Plant).includes(:sun)
        .where(suns: { amount: params[:filter_by_sun]})
        .where(pet_friendly: @pet_friendly)
    elsif params[:filter_by_sun]
      @plants = policy_scope(Plant).includes(:sun).where(suns: { amount: params[:filter_by_sun]})
    elsif params[:filter_pet_friendly]
      @plants = policy_scope(Plant).where(pet_friendly: @pet_friendly)
    else
      @plants = policy_scope(Plant)
    end
  end

  def show; end

  def new
    @plant = Plant.new
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
    authorize @plant
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @plant.update(plant_params)
      redirect_to plant_path(@plant)
    else
      render :edit
    end
  end

  def destroy
    @plant.destroy
    redirect_to plants_path
  end

  private

  def plant_find
    @plant = Plant.find(params[:id])
    authorize @plant
  end

  def plant_params
    params.require(:plant).permit(:name, :scientific_name, :description, :water_level, :water_text, :pet_friendly, :best_seller, :size, :price, :photo, :user_id, :category_id, :sun_id, :water_period_id, :color_ids => [])
  end
end
