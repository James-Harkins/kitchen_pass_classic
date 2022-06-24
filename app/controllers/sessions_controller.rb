class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to "/dashboard"
      flash[:log_out] = "You must log out to log in, fucko!"
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to "/dashboard"
      else
        redirect_to "/login"
        flash[:invalid_credentials] = "Invalid credentials, fucko!"
      end
    else
      redirect_to "/login"
      flash[:invalid_credentials] = "Invalid credentials, fucko!"
    end
  end
end
