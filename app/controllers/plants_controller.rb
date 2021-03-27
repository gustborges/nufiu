class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :plant_find, only: [:show, :edit, :update, :destroy]

  def index
    @allowed_plants = policy_scope(Plant)
    @search = policy_scope(Plant).search do
      fulltext params[:q]

      any_of do
        with(:category, params[:category]) if params[:category].present?
        with(:sun, params[:sun]) if params[:sun].present?
        with(:water_level, params[:water_level]) if params[:water_level].present?
        with(:pet_friendly, params[:pet_friendly]) if params[:pet_friendly].present?
      end
      # facet :category
      facet :sun
      facet :pet_friendly
      facet :water_level
    end
    @plants = @search.results
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
    params.require(:plant).permit(:name, :scientific_name, :description, :water_level, :water_text, :pet_friendly, :best_seller, :size, :price, :photo, :user_id, :category_id, :sun_id, :color_ids => [])
  end
end
