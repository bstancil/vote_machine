class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :redirect_to_active_hack
  before_filter :authorize
  
  
  protected
  
    def authorize
      if session[:voter_id] == nil
        redirect_to login_url
      end
    end
    
    def redirect_to_active_hack
      voter = current_voter
      if voter.name != "5e8bf9c15200956c52c80f3396332b13"
        redirect_to booth_index_path
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
