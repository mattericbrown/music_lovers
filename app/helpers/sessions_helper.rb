module SessionsHelper

  def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    if current_user == nil
      flash[:notice] = "You must be logged in to view that."
      redirect_to login_path
    end
  end

  def logged_in
    unless logged_in?
      redirect_to login_path
    end
  end

  def logout
    @current_user = session[:user_id] = nil
  end
end
