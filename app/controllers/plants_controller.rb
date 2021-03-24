class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :plant_find, only: [:show, :edit, :update, :destroy]

  def index
    @lights = Light.all
    if params["search"].present?
      @filter = params["search"]["light"].concat(params["search"]["categories"]).concat(params["search"]["name"]).flatten.reject(&:blank?).join("")
      @plants = policy_scope(Plant).all.search("#{@filter}")
    else
      @plants = policy_scope(Plant)
    end
    respond_to do |format|
      format.html
      format.js
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
    @light = @plant.light
    authorize @plant
  end

  def plant_params
    params.require(:plant).permit(:name, :scientific_name, :description, :water_level, :water_text, :pet_friendly, :best_seller, :size, :price, :photo, :user_id, :category_id, :light_id, :color_ids => [])
  end
end
