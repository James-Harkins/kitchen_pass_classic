require "rails_helper"

describe User do
  describe "validations" do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }

    it { should validate_presence_of :email }

    describe "email uniqueness" do
      before do
        user = User.create!(first_name: "Tony", last_name: "Soprano", email: "she_was_a_beautiful_creetchuh@gmail.com", password: "test123", password_confirmation: "test123")
      end

      it { should allow_value("some_pulp@gmail.com").for(:email) }
      it { should_not allow_value("she_was_a_beautiful_creetchuh@gmail.com").for(:email) }
    end

    it { should validate_presence_of :password }
    it { should have_secure_password }

    it "should not have a password attribute and the password_digest attribute should be a hash" do
      user = User.create!(first_name: "Tony", last_name: "Soprano", email: "she_was_a_beautiful_creetchuh@gmail.com", password: "test123", password_confirmation: "test123")

      expect(user).not_to have_attribute(:password)
      expect(user.password_digest).not_to eq("test123")
    end

    it "is created with a default role of 0" do
      user = User.create!(first_name: "Tony", last_name: "Soprano", email: "she_was_a_beautiful_creetchuh@gmail.com", password: "test123", password_confirmation: "test123")

      expect(user.role).to eq(0)
      expect(user.default?).to be true
      expect(user.admin?).to be false
    end

    it "can be created as an admin" do
      user = User.create!(first_name: "Tony", last_name: "Soprano", email: "she_was_a_beautiful_creetchuh@gmail.com", password: "test123", password_confirmation: "test123", role: 1)

      expect(user.role).to eq(1)
      expect(user.default?).to be false
      expect(user.admin?).to be true
    end
  end

  describe "relationships" do
    it { should have_many :user_trips }
    it { should have_many(:trips).through(:user_trips) }
    it { should have_many :user_nights }
    it { should have_many :user_trip_courses }
    it { should have_many(:trip_courses).through(:user_trip_courses) }
    it { should have_many :user_trip_meals }
    it { should have_many(:trip_meals).through(:user_trip_meals) }
  end
end
