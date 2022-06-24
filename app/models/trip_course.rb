class TripCourse < ApplicationRecord
  validates_presence_of :total_cost
  validates_presence_of :cost_per_person

  belongs_to :trip
  belongs_to :course
end
