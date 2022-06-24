require "rails_helper"

describe Location do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :state }
  end

  describe "relationships" do
    it { should have_many :trips }
    it { should have_many :courses }
  end
end
