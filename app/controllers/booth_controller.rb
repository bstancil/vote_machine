class BoothController < ApplicationController
  #skip_before_filter :redirect_to_active_hack
    
  def index
    @hack = Hack.where("active_hack = true ")
    @voter = current_voter
    @votes = Vote.order("created_at DESC").limit(1)
    @departments = ['Analytics','Rails','WEB TEAM','Clients','Core Services','Infrastructure','Other','Product','UX']
    @vote_logs = VoteLog.where(:hack_id => Hack.find_by_active_hack(true).id, 
                               :created_at => (Hack.find_by_active_hack(true).start_time)..Time.now)
                         .order("created_at")
    
  end
  
  
end
