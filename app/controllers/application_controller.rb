class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def require_signin!
    unless current_user
      # flash[:message] = "Please sign in to access this page"
      redirect_to root_path
    end
  end
  helper_method :require_signin!

  def current_reign
    @current_reign ||= Reign.last
  end

  helper_method :current_reign

  def current_monarch
    current_monarch_id = Reign.last.user_id
    @current_monarch ||= User.find(current_monarch_id)
  end

  helper_method :current_monarch

  def usurper
    @ousted_monarch_last_reign = current_user.reigns.last
    @usurper_reign = Reign.find(@ousted_monarch_last_reign.id + 1)
    @usurper = User.find(@usurper_reign.user_id)
  end

  helper_method :usurper

  def deadly_weapon
    @ousted_monarch_last_reign = current_user.reigns.last
    @usurper_reign = Reign.find(@ousted_monarch_last_reign.id + 1)
    @weapon = @usurper_reign.weapon
  end

  helper_method :deadly_weapon


end
