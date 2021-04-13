class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  def home;end
  def about;end
  def privacy;end
  def faq;end
  def delivery;end
  def workshop;end
  def payment;end 
  def contact;end
end
