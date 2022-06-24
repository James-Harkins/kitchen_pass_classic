class Meal < ApplicationRecord
  validates_presence_of :name

  has_many :trip_meals
  has_many :user_trip_meals, through: :trip_meals
end
