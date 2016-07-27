class UsersController < ApplicationController
  before_action :require_signin!

  def index
    # @top_ten_duration = Reign.top_ten_by_duration
    # @top_ten_reign_number = Reign.top_ten_by_reign_number
  end

  def show
  end

end
