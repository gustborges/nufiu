class Plant < ApplicationRecord
  belongs_to :user
  has_many :cart_plants
  has_one_attached :photo
end
