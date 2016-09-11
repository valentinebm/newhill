class RefuseController < ApplicationController
  def index
    session[:user_id] = nil
    render :index
  end
end
