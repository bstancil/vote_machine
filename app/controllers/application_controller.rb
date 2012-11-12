class ApplicationController < ActionController::Base
  protect_from_forgery
    
  private 

     def current_voter
       Voter.find(session[:voter_id])
     rescue ActiveRecord::RecordNotFound
       voter = Voter.create
       session[:voter_id] = voter.id
       voter
     end
end
