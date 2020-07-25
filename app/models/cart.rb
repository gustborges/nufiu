class Cart < ApplicationRecord
  # belongs_to :user, dependent: :destroy
  has_many :cart_plants
  has_many :plants, through: :cart_plants
end
