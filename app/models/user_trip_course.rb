class UserTripCourse < ApplicationRecord
  belongs_to :user
  belongs_to :trip_course
end
