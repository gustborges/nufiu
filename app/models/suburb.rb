class Suburb < ApplicationRecord
  has_many :users
  has_many :shippings, dependent: :destroy
  default_scope { order('suburbs.name ASC') }

  validates :name, presence: true, uniqueness: true
end
