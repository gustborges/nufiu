# frozen_string_literal: true

class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :plant_find, only: %i[show edit update destroy edit_published]

  def index
    # Faceted search
    @pet_friendly = params[:filter_pet_friendly] == '1'
    @sun = params[:filter_by_sun] ? true : false
    @water = params[:filter_by_water] ? true : false
    @plants = policy_scope(Plant).includes(:sun, :water_period)

    if @pet_friendly && @sun && @water
      @plants =
        @plants.where(
          pet_friendly: true,
          suns: {
            amount: params[:filter_by_sun]
          }
        )
    end
    if @pet_friendly && @sun
      @plants =
        @plants.where(
          pet_friendly: true,
          suns: {
            amount: params[:filter_by_sun]
          }
        )
    end
    @plants = @plants.where(pet_friendly: true) if @pet_friendly
    @plants = @plants.where(suns: { amount: params[:filter_by_sun] }) if @sun
    if @water
      @plants =
        @plants.where(
          water_periods: {
            amount: params[:filter_by_water]
          }
        )
    end
    @plants = policy_scope(@plants).with_attached_photo
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
