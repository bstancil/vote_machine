class AdminController < ApplicationController
  
  def index
    
    @hacks = Hack.all
    @voters = Voter.all
    @departments = ['Analytics','Clients','Front End','Infrastructure','Product','QA','Rails','Other']
    @gen = [true,false]
    
  end
end
