class BoothController < ApplicationController
  before_filter :redirect_to_active_hack
  
  def index
    @hacks = Hack.all
    @voter = current_voter
    @departments = ['Analytics','Rails','WEB TEAM','Clients','Core Services','Infrastructure','Other','Product','UX']
  end
  
  
end
