class Plant < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :sun
  has_many :plant_colors
  has_many :colors, through: :plant_colors
  has_many :cart_plants
  has_one_attached :photo

  searchable do
    text :name, :boost => 5
    text :scientific_name, :description
    boolean :pet_friendly
    text :sun do
      sun.amount
    end
    text :category do
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
