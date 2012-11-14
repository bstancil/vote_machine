class AdminController < ApplicationController
  before_filter :redirect_to_active_hack
  
  def index
    
    @hacks = Hack.all
    @voters = Voter.all
    @departments = ['Analytics','Rails','WEB TEAM','Clients','Core Services','Infrastructure','Other','Product','UX']
    @gen = [true,false]
    
  end
end
