class ReignsController < ApplicationController
  def index
    @reigns = Reign.all
    @monarchs = []
    @reigns.each do |reign|
      monarch = User.find(reign.user_id)
      @monarchs.push(monarch)
    end
  end
end
