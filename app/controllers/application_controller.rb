class ApplicationController < ActionController::Base
  protect_from_forgery
  
#  before_filter :authorize
#  before_filter :admin_authorize
  
  protected
  
    def authorize
      unless Voter.find_by_id(session[:voter_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
    
    def redirect_to_active_hack
      active_hack = Hack.find_by_active_hack(true)
      unless Voter.find_by_id(session[:voter_id ])
        redirect_to hack_path(active_hack)
      end
    end
    
  private 

     def current_voter
       Voter.find(session[:voter_id])
     rescue ActiveRecord::RecordNotFound
       voter = Voter.create
       session[:voter_id] = voter.id
       session[:name] = voter.name
       voter
     end
end
