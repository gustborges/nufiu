class CartPlant < ApplicationRecord
  belongs_to :cart
  belongs_to :plant

  def workshop?
    plant.category.name == 'Workshop'
  end
end
