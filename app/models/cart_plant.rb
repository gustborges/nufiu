class CartPlant < ApplicationRecord
  belongs_to :cart
  belongs_to :plant
end
