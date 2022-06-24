require "rails_helper"

describe TripMeal do
  describe "validations" do
    it { should validate_presence_of :date }
  end

  describe "relationships" do
    it { should belong_to :trip }
    it { should belong_to :meal }
  end
end
