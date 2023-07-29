class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home; end

  def about; end

  def privacy; end

  def faq; end

  def delivery; end

  def workshop
    @workshop_premium = Plant.find(78)
    @workshop_regular = Plant.find(77)
  end

  def payment; end

  def contact; end

  def robots
    respond_to :text
  end
end
