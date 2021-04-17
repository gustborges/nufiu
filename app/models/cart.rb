class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_plants, dependent: :destroy
  has_many :plants, through: :cart_plants
end