class SessionsController < ApplicationController

  def create
    if request.env['omniauth.auth']
      user = User.create_with_omniauth(request.env['omniauth.auth'])
      unless user.id == current_monarch.id
        Reign.transition(user.id)
      end
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      user = User.find_by_email(params[:email])
      user && user.authenticate(params[:password])
      unless user.id == current_monarch.id
        Reign.transition(user.id)
      end
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

end
