require "rails_helper"

describe UserTripMeal do
  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to :trip_meal }
  end
end
