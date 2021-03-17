class Plant < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :plant_colors
  has_many :colors, through: :plant_colors
  has_many :cart_plants
  has_one_attached :photo
  # accepts_nested_attributes_for :category
end
