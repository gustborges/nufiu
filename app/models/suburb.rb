class Suburb < ApplicationRecord
  has_many :users
  has_many :shippings
  default_scope { order('suburbs.name ASC') }

end
