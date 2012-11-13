class SessionsController < ApplicationController
#  skip_before_filter :authorize
  
  def new
  end

  def create
    voter = Voter.find_by_name(params[:name])
    if voter
      session[:voter_id] = voter.id
      session[:name] = voter.name  
      redirect_to admin_url
    else
      redirect_to login_url, alert: "Create a New Voter"
    end
  end

  def destroy
    session[:voter_id] = nil
    session[:name] = nil
    redirect_to booth_index_url, notice: "Logged Out"
  end
end
