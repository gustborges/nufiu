class Shipping < ApplicationRecord
  belongs_to :suburb, optional: true
  belongs_to :user
end
