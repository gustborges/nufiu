class Category < ApplicationRecord
  has_many :plants
  validates :name, presence: true, uniqueness: true
end
