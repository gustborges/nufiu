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
