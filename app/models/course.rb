class Course < ApplicationRecord
  validates_presence_of :name
  validates :name, uniqueness: true
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip

  belongs_to :location
  has_many :trip_courses
  has_many :user_trip_courses, through: :trip_courses
end
