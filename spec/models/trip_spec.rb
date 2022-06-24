require "rails_helper"

describe Trip do
  describe "validations" do
    it { should validate_presence_of :year }

    describe "year uniqueness" do
      before do
        trip = Trip.create!(year: "2022", total_cost: 9500.0)
      end
      it { should allow_value("2023").for(:year) }
      it { should_not allow_value("2022").for(:year) }
    end

    it { should validate_presence_of :total_cost }
  end

  describe "relationships" do
    it { should have_one :house }
    it { should have_many :nights }
    it { should have_many :user_trips }
    it { should have_many(:users).through(:user_trips) }
    it { should have_many :trip_courses }
    it { should have_many(:courses).through(:trip_courses) }
    it { should have_many :trip_meals }
    it { should have_many(:meals).through(:trip_meals) }
  end
end
