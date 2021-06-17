class ShippingsController < ApplicationController
  before_action :find_shipping, only: %i[create update]

  def new
    @shipping = Shipping.new
  end

  def create
    @user = @shipping.user
    @shipping = Shipping.new(shipping_params)
    authorize @shipping
    @shipping.save
  end

  def update
    authorize @shipping
    redirect_back fallback_location: new_cart_payment_path(@cart) if @shipping.update(shipping_params)
  end

  private

  def find_shipping
    @shipping = Shipping.find(params[:id])
  end

  def shipping_params
    params
      .require(:shipping)
      .permit(
        :address,
        :address_complement,
        :location_details,
        :zip_code,
        :suburb_id,
        :pick_up,
        :phone
      )
  end
end
