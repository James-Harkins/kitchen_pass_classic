require "rails_helper"

describe "/register path" do
  describe "as a visitor" do
    describe "when i visit the register page" do
      before do
        @user_1 = User.create!(first_name: "Tony", last_name: "Soprano", email: "wokeupthismorning@gmail.com", password: "test123", password_confirmation: "test123")
      end

      it "i see a form to input my user data and register" do
        visit "/register"

        fill_in "First name", with: "Junior"
        fill_in "Last name", with: "Soprano"
        fill_in "Email", with: "varsity_athlete@gmail.com"
        fill_in "Password", with: "test123"
        fill_in "Password confirmation", with: "test123"

        click_button "Register"

        expect(current_path).to eq("/login")

        fill_in "Email", with: "varsity_athlete@gmail.com"
        fill_in "Password", with: "test123"
        click_button "Log In"

        expect(current_path).to eq("/dashboard")
      end

      it "the form will not accept the input if the user does not input a first name" do
        visit "/register"

        fill_in "Last name", with: "Soprano"
        fill_in "Email", with: "varsityathlete@gmail.com"
        fill_in "Password", with: "test123"
        fill_in "Password confirmation", with: "test123"

        click_button "Register"

        expect(current_path).to eq("/register")
        expect(page).to have_content("First name can't be blank, fucko!")
      end

      it "the form will not accept the input if the user does not input a first name" do
        visit "/register"

        fill_in "First name", with: "Junior"
        fill_in "Email", with: "varsityathlete@gmail.com"
        fill_in "Password", with: "test123"
        fill_in "Password confirmation", with: "test123"

        click_button "Register"

        expect(current_path).to eq("/register")
        expect(page).to have_content("Last name can't be blank, fucko!")
      end

      it "the form will not accept an email that already exists for some other user in the database" do
        visit "/register"

        fill_in "First name", with: "Junior"
        fill_in "Last name", with: "Soprano"
        fill_in "Email", with: "wokeupthismorning@gmail.com"
        fill_in "Password", with: "test123"
        fill_in "Password confirmation", with: "test123"

        click_button "Register"

        expect(page).to have_content("Email has already been taken, fucko!")
      end

      it "the form will not accept the submission if the user only submits a password without a confirmation" do
        visit "/register"

        fill_in "First name", with: "Junior"
        fill_in "Last name", with: "Soprano"
        fill_in "Email", with: "varsity_athlete@gmail.com"
        fill_in "Password", with: "test123"

        click_button "Register"

        expect(page).to have_content("Password confirmation doesn't match Password, fucko!")
      end

      it "the form will not accept the submission if the user only submits a password confirmation without an original password" do
        visit "/register"

        fill_in "First name", with: "Junior"
        fill_in "Last name", with: "Soprano"
        fill_in "Email", with: "varsity_athlete@gmail.com"
        fill_in "Password confirmation", with: "test123"

        click_button "Register"

        expect(page).to have_content("Password can't be blank, fucko!")
      end

      it "the form will not accept the submission if the user only submits passwords that do not match" do
        visit "/register"

        fill_in "First name", with: "Junior"
        fill_in "Last name", with: "Soprano"
        fill_in "Email", with: "varsity_athlete@gmail.com"
        fill_in "Password", with: "test123"
        fill_in "Password confirmation", with: "123test"

        click_button "Register"

        expect(page).to have_content("Password confirmation doesn't match Password, fucko!")
      end
    end
  end

  describe "as a logged in user" do
    describe "when i visit the /register path" do
      before do
        @user_1 = User.create!(first_name: "Tony", last_name: "Soprano", email: "wokeupthismorning@gmail.com", password: "test123", password_confirmation: "test123")
      end

      it "i am redirected to my dashboard and see a message that says that i must logout to register" do
        visit "/login"

        fill_in "Email", with: "wokeupthismorning@gmail.com"
        fill_in "Password", with: "test123"
        click_button "Log In"

        visit "/register"

        expect(current_path).to eq("/dashboard")
        expect(page).to have_content("You must log out to register, fucko!")
      end
    end
  end
end
