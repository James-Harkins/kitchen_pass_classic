require "rails_helper"

describe UserTrip do
  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to :trip }
  end
end
