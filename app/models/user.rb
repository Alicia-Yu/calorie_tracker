class User < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_many :habits, dependent: :destroy
  has_many :notes, dependent: :destroy
  
  validates :daily_calorie_goal, :daily_protein_goal, presence: true
end