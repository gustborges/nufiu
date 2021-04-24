class Plant < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :sun
  belongs_to :water_period
  has_many :plant_colors
  has_many :colors, through: :plant_colors
  has_many :cart_plants, dependent: :destroy
  has_one_attached :photo
  default_scope { order('best_seller DESC, RANDOM()') }

  def sun_amount
    sun.amount
  end

  def category_name
    category.name
  end

  def water_amount
    water_period.amount
  end
end
