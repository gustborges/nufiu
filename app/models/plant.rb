class Plant < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :light
  has_many :plant_colors
  has_many :colors, through: :plant_colors
  has_many :cart_plants
  has_one_attached :photo
  # accepts_nested_attributes_for :category
  # accepts_nested_attributes_for :light
  # acts_as_taggable_on :categories
  # acts_as_taggable_on :lights
  acts_as_taggable

  include PgSearch::Model
  pg_search_scope :search,
    against: [ :name, :water_level, :pet_friendly ],
    associated_against: {
      light: [ :level ],
      categories: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }

end
