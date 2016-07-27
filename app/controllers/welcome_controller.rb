class WelcomeController < ApplicationController
  def index
    redirect_to users_path if current_user

    # @top_ten_duration = Reign.top_ten_by_duration
    # @top_ten_reign_number = Reign.top_ten_by_reign_number
  end
end
