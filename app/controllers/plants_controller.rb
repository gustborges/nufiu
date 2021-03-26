class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :plant_find, only: [:show, :edit, :update, :destroy]

  def index
    @allowed_plants = policy_scope(Plant)
    @search = policy_scope(Plant).search do
      fulltext params[:query]
      facet(:category)
      facet(:sun)
      # with(:category_name, params[:cat]) if params[:cat].present?
    end

    @plants = @search.results

    # if params[:query].present?
    #   @plants = allowed_plants.search(params[:query]).results
    # else
    #   @plants = allowed_plants
    # end
    # respond_to do |format|
    #   format.html
    #   format.js
    # end
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
