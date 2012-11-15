class BoothController < ApplicationController
  before_filter :redirect_to_active_hack
  
  def index
    @hack = Hack.where("active_hack = true ")
    @voter = current_voter
    @votes = Vote.order("created_at DESC").limit(25)
    @departments = ['Analytics','Rails','WEB TEAM','Clients','Core Services','Infrastructure','Other','Product','UX']
    @vote_logs = VoteLog.where(:hack_id => Hack.find_by_active_hack(true).id)
    
  end
  
  
end
