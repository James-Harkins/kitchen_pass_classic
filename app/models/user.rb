class User < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates :email, uniqueness: true
  has_secure_password

  has_many :user_trips
  has_many :trips, through: :user_trips
  has_many :user_nights
  has_many :user_trip_courses
  has_many :trip_courses, through: :user_trip_courses
  has_many :user_trip_meals
  has_many :trip_meals, through: :user_trip_meals
end
