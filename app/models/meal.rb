class Meal < ApplicationRecord
  belongs_to :user
  
  validates :meal_type, :calories, :protein, presence: true
end