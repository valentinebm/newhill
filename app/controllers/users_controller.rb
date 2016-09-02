class UsersController < ApplicationController
  before_action :require_signin!

  def index
    @reign = Reign.new
  end

  def show
  end

  def update
    previous_reign = Reign.last

    begin
      @reign = Reign.create!(user_id: current_user.id, weapon: params[:reign][:weapon])
    rescue Exception => e
      flash[:message] = e.message
      redirect_to users_path
    end

    previous_reign.finished = DateTime.now
    previous_reign.duration = previous_reign.finished - previous_reign.created_at
    previous_reign.save

    User.find(previous_reign.user_id).update_total_reign(previous_reign.duration)
    redirect_to users_path
  end

  def check_if_still_monarch
    render json: current_monarch.id == params[:user_id].to_i
  end

end
