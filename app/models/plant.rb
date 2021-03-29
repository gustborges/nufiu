class Plant < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :sun
  belongs_to :water_period
  has_many :plant_colors
  has_many :colors, through: :plant_colors
  has_many :cart_plants
  has_one_attached :photo

  def sun_amount
    sun.amount
  end

  def category_name
    category.name
  end

end
