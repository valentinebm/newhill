class UsersController < ApplicationController
  before_action :require_signin!

  def index
    @reign = Reign.new
    if current_user.id == 189 || current_user.id == 194 || current_user.id == 238
      redirect_to out_path
    end
  end

  def show
  end

  def update
    previous_reign = Reign.last

    begin
      @reign = Reign.create!(user_id: current_user.id, weapon: params[:reign][:weapon])

      previous_reign.finished = DateTime.now
      previous_reign.duration = previous_reign.finished - previous_reign.created_at
      previous_reign.save

      User.find(previous_reign.user_id).update_total_reign
      redirect_to users_path
    rescue Exception => e
      flash[:message] = e.message
      redirect_to users_path
    end
  end

  def check_if_still_monarch
    render json: current_monarch.id == params[:user_id].to_i
  end

end
