class UsersController < ApplicationController
  def show
    @name = user.name
  end
end
