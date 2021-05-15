class Sun < ApplicationRecord
  has_many :plants
  validates :amount, presence: true
end
