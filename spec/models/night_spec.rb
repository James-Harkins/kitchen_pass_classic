require "rails_helper"

describe Night do
  describe "validations" do
    it { should validate_presence_of :date }
    it { should validate_presence_of :cost_per_person }
  end

  describe "relationships" do
    it { should belong_to :trip }
  end
end
