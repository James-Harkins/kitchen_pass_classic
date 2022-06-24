class UserTripMeal < ApplicationRecord
  belongs_to :user
  belongs_to :trip_meal
end
