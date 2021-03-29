class Plant < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :sun
  belongs_to :water_period
  has_many :plant_colors
  has_many :colors, through: :plant_colors
  has_many :cart_plants
  has_one_attached :photo

  searchable do
    text :name, :boost => 5
    text :scientific_name, :description
    string :water_level
    boolean :pet_friendly
    string :water_period do
      water_period.amount
    end
    string :sun do
      sun.amount
    end
    string :category do
      category.name
    end
  end

  def sun_amount
    sun.amount
  end

  def category_name
    category.name
  end

end
