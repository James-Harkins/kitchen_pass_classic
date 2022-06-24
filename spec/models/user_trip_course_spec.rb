require "rails_helper"

describe UserTripCourse do
  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to :trip_course }
  end
end
