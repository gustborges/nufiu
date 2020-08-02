class Plant < ApplicationRecord
  has_many :cart_plants
  has_one_attached :photo
end
