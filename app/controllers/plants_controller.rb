# frozen_string_literal: true

class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :plant_find, only: %i[show edit update destroy edit_published]

  def index
    if params[:sun] || params[:water] || params[:pet_friendly]
      filters = {}
      filters[:sun] = Sun.find_by(indicator: params[:sun]) if params[:sun]
      filters[:water_period] = WaterPeriod.find_by(indicator: params[:water]) if params[:water]
      filters[:pet_friendly] = true if params[:pet_friendly]
      @plants = policy_scope(Plant).includes(:sun, :water_period).with_attached_photo.where(filters)
    else
      @plants = policy_scope(Plant)
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

  def filtering_params(params)
    params.slice(:pet_friendly, :water, :sun)
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
        :pet_friendly,
        :best_seller,
        :size,
        :price,
        :photo,
        :user_id,
        :category_id,
        :sun_id,
        :water_period_id,
        :published,
        color_ids: []
      )
  end
end
