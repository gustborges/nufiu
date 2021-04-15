class User < ApplicationRecord
  after_create :send_welcome_email
  has_many :carts, dependent: :destroy
  has_many :plants
  belongs_to :suburb

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    admin == true
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
