class CartPlant < ApplicationRecord
  belongs_to :cart
  belongs_to :plant
  validates :amount, :cart, :plant, presence: true

  def workshop?
    plant.category.name == 'Workshop'
  end

  def kokedama?
    plant.category.name == 'Kokedama'
  end
end
