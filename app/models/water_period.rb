class WaterPeriod < ApplicationRecord
  has_many :plants
  validates :amount, presence: true
end
