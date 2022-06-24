class UsersController < ApplicationController
  def show
  end

  def new
    if current_user
      redirect_to "/dashboard"
      flash[:log_out] = "You must log out to register, fucko!"
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to "/login"
    else
      redirect_to "/register"
      flash[:notice] = "#{user.errors.full_messages.to_sentence}, fucko!"
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
