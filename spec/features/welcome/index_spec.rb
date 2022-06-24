require "rails_helper"

describe "welcome page" do
  describe "as a visitor" do
    describe "when i visit the welcome page" do
      it "i see the title of the app" do
        visit "/"

        expect(page).to have_content("Welcome back to the KPC!")
      end

      it "i see a button to log in, which redirects me to the login path" do
        visit "/"

        click_button "Login"

        expect(current_path).to eq("/login")
      end

      it "i see a button to register, which redirects me to the register path" do
        visit "/"

        click_button "Register"

        expect(current_path).to eq("/register")
      end
    end
  end
end
