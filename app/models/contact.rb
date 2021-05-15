class Contact < ApplicationRecord
  validates :email, presence: true
end
