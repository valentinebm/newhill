class UsersController < ApplicationController
  before_action :require_signin!

  def index
  end

  def show
    @user = current_user
  end
  
end
