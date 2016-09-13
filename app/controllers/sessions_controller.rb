class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.confirm(user_params)
    if @user
      login(@user)
      flash[:notice] = "Successfully logged in."
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Incorrect email or password."
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end

private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
