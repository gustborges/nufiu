class Shipping < ApplicationRecord
  belongs_to :suburb
  belongs_to :user
end
