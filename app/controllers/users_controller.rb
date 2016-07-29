class UsersController < ApplicationController
  before_action :require_signin!

  def index
    @reign = Reign.new
  end

  def show
  end

  def update
    @previous_reign = Reign.last
    @previous_reign.finished = DateTime.now
    @previous_reign.duration = @previous_reign.finished - @previous_reign.created_at
    @previous_reign.save

    User.find(@previous_reign.user_id).update_total_reign(@previous_reign.duration)

    @reign = Reign.create(user_id: current_user.id, weapon: params[:reign][:weapon])

    redirect_to users_path
  end

end
