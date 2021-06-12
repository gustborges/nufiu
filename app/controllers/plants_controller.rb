# frozen_string_literal: true

class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :plant_find, only: %i[show edit update destroy edit_published]

  def index
    if params[:plant]
      @plants = policy_scope(Plant).includes(:sun, :water_period).where(filter_plants).with_attached_photo
    else
      @plants = policy_scope(Plant).includes(:sun, :water_period).with_attached_photo
    end

    respond_to do |format|
      format.js { render 'plants/filter.js.erb' }
      format.html
    end
  end

  def show
    if user_signed_in?
      Analytics.track(
        user_id: current_user.id,
        event: 'Visualizou produto',
        properties: { name: current_user.name, email: current_user.email, product: @plant.name, price: @plant.price,
                      step: 1 }
      )
    end
  end

  def new
    @plant = Plant.new
    authorize @plant
  end

  def create
    @plant = Plant.new(plant_params)
    authorize @plant
    @plant.user = current_user
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

  def edit_published
    @plant.published = if @plant.published
                         false
                       else
                         true
                       end
    @plant.save
    respond_to do |format|
      format.html { redirect_to plants_path }
      format.json { head :no_content }
    end
  end

  def destroy
    if @plant.destroy
      redirect_to plants_path
    else
      render :show
    end
  end

  private

  def plant_find
    @plant = Plant.friendly.find(params[:id])
    authorize @plant
  end

  def plant_params
    params
      .require(:plant)
      .permit(
        :name,
        :scientific_name,
        :description,
        :water_level,
        :water_text,
        :best_seller,
        :size,
        :price,
        :photo,
        :user_id,
        :category_id,
        :published,
        :pet_friendly,
        sun: [],
        water_period: [],
        color_ids: []
      )
  end

  def filter_plants
    # Clean the array from empty string and transform into integer
    params_sun = params[:plant][:sun].reject(&:empty?).map(&:to_i)
    params_water_period = params[:plant][:water_period].reject(&:empty?).map(&:to_i)

    pet_friendly = params[:plant][:pet_friendly] == "1" ? true: false
    sun = params_sun.present? ? params_sun : Sun.all.pluck(:id)
    water_period = params_water_period.present? ? params_water_period : WaterPeriod.all.pluck(:id)
    return { pet_friendly: pet_friendly, sun: sun, water_period: water_period }
  end
end
