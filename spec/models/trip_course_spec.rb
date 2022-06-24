require "rails_helper"

describe TripCourse do
  describe "validations" do
    it { should validate_presence_of :total_cost }
    it { should validate_presence_of :cost_per_person }
  end

  describe "relationships" do
    it { should belong_to :trip }
    it { should belong_to :course }
  end
end
