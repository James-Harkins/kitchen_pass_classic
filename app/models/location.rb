class Location < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :state

  has_many :trips
  has_many :courses
end
