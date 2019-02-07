class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to login_url, notice: "Welcome, #{@user.name}! Now, lets fly--"
    else
      render :new
    end
  end

  def destroy
    reset_session
    ##for security this should also be used after a certain amount of inactive time has elapsed?
    redirect_to login_url
  end

  private

  def users_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

end
