class Contact < ApplicationRecord
  validates_presence_of :subject, :message, :email
end
