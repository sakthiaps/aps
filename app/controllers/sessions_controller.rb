class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(sessions_params[:email])

    if user && user.authenticate(sessions_params[:password])
      session[:user_id] = user.id
      redirect_to home_path, notice: "Welcome back, #{current_user.name}"
    else
      redirect_to root_path, alert: "Incorrect username or password"
    end
  end

  def destroy
    user = current_user.name
    session[:user_id] = nil
    flash[:notice] = "See you again, #{user}!"
    redirect_to login_url
  end

  private

  def sessions_params
    params.permit(:email, :password)
  end

end
