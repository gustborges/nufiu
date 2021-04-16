class ShippingsController < ApplicationController
  before_action :find_shipping, only: [:create, :update]

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
    @shipping.update(shipping_params)
  end

  private

  def find_shipping
    @shipping = Shipping.find(params[:id])
  end

  def shipping_params
    params.require(:shipping).permit(:address, :address_complement, :location_details, :zip_code, :suburb_id)
  end

end
