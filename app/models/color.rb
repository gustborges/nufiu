class Color < ApplicationRecord
  has_many :plant_colors
  has_many :plants, through: :plant_colors
end
