class Trip < ApplicationRecord
  validates_presence_of :year
  validates :year, uniqueness: true
  validates_presence_of :total_cost

  belongs_to :location
  has_one :house
  has_many :nights
  has_many :user_trips
  has_many :users, through: :user_trips
  has_many :trip_courses
  has_many :courses, through: :trip_courses
  has_many :trip_meals
  has_many :meals, through: :trip_meals
end
