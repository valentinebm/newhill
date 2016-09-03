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

  def previous_reign
    Reign.where('id < ?', current_reign.id).order(id: :desc).first
  end

  helper_method :previous_reign

  def current_monarch
    current_monarch_id = Reign.last.user_id
    @current_monarch ||= User.find(current_monarch_id)
  end

  helper_method :current_monarch

  def usurper
    User.find(usurper_reign.user_id)
  end

  helper_method :usurper

  def deadly_weapon
    usurper_reign.weapon
  end

  helper_method :deadly_weapon

  def usurper_reign
    @usurper_reign ||= Reign.where('id > ?', last_reign.id).order(:id).first
  end

  def last_reign
    @last_reign ||= current_user.reigns.last
  end
end
