require "rails_helper"

describe UserNight do
  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to :night }
  end
end
