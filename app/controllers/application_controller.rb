class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :redirect_to_active_hack
  #before_filter :authorize
  
  
  protected
  
    def authorize
      if session[:voter_id] == nil
        redirect_to login_url, notice: "Please log in"
      end
    end
    
    def redirect_to_active_hack
      active_hack = Hack.find_by_active_hack(true)
      if session[:voter_id ] != 4
        redirect_to booth_path
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
