class BoothController < ApplicationController
  def index
    @hacks = Hack.order(:title)
  end
  
end
