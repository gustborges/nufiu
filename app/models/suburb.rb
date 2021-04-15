class Suburb < ApplicationRecord
  has_many :users
  default_scope { order('suburbs.name ASC') }
end
