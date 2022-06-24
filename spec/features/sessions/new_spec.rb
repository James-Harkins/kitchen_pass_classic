require "rails_helper"

describe "/login path" do
  describe "as a visitor" do
    describe "when i visit the /login path" do
      before do
        @user_1 = User.create!(first_name: "Tony", last_name: "Soprano", email: "wokeupthismorning@gmail.com", password: "test123", password_confirmation: "test123")
      end

      it "i see a form to input my user data, which redirects me to my dashboard" do
        visit "/login"

        fill_in "Email", with: "wokeupthismorning@gmail.com"
        fill_in "Password", with: "test123"
        click_button "Log In"

        expect(current_path).to eq("/dashboard")
      end

      it "if i input bad credentials, i receive an error message" do
        visit "/login"

        fill_in "Email", with: "varsity_athlete@gmail.com"
        fill_in "Password", with: "test123"
        click_button "Log In"

        expect(current_path).to eq("/login")
        expect(page).to have_content("Invalid credentials, fucko!")

        fill_in "Email", with: "wokeupthismorning@gmail.com"
        fill_in "Password", with: "123test"
        click_button "Log In"

        expect(current_path).to eq("/login")
        expect(page).to have_content("Invalid credentials, fucko!")
      end
    end
  end

  describe "as a logged in user" do
    describe "when i visit the /login path" do
      it "i am redirected to my dashboard and see a message that says that i must logout to register" do
        visit "/login"

        fill_in "Email", with: "wokeupthismorning@gmail.com"
        fill_in "Password", with: "test123"
        click_button "Log In"

        visit "/login"

        expect(current_path).to eq("/dashboard")
        expect(page).to have_content("You must log out to log in, fucko!")
      end
    end
  end
end
