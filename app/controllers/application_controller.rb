class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_signin!
    unless current_user
      flash[:message] = "Please sign in to access this page"
      redirect_to root_path
    end
  end

  helper_method :require_signin!

end
