class ReignsController < ApplicationController
  def index
    @reigns = Reign.all
    end

end
