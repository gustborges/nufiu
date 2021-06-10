class Plant < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  belongs_to :category
  belongs_to :sun, optional: true
  belongs_to :water_period, optional: true
  has_many :plant_colors
  has_many :colors, through: :plant_colors
  has_many :cart_plants, dependent: :destroy
  has_one_attached :photo
  default_scope { order('best_seller DESC, RANDOM()') }
  scope :filter_by_pet_friendly, ->(pet_friendly) { where pet_friendly: pet_friendly }
  scope :filter_by_water, lambda { |water_indicator|
                            where water_period_id: WaterPeriod.find_by(indicator: water_indicator)
                          }
  scope :filter_by_sun, ->(sun_indicator) { where sun_id: Sun.find_by(indicator: sun_indicator) }

  validates :name, :scientific_name, :description, :size, :price, :water_text, :category, :water_period, :sun, :user,
            presence: true
  validates :name, uniqueness: true

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
