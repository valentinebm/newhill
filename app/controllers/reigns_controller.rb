class ReignsController < ApplicationController
  def index
    @reigns = Reign.order(created_at: :asc)
    end

end
