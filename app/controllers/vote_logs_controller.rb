class VoteLogsController < ApplicationController
  # GET /vote_logs
  # GET /vote_logs.json
  def index
    @vote_logs = VoteLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vote_logs }
    end
  end

  # GET /vote_logs/1
  # GET /vote_logs/1.json
  def show
    @vote_log = VoteLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vote_log }
    end
  end

  # GET /vote_logs/new
  # GET /vote_logs/new.json
  def new
    @vote_log = VoteLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vote_log }
    end
  end

  # GET /vote_logs/1/edit
  def edit
    @vote_log = VoteLog.find(params[:id])
  end

  # POST /vote_logs
  # POST /vote_logs.json
  def create
    @vote_log = VoteLog.new(params[:vote_log])    

    respond_to do |format|
      if @vote_log.save
        format.html { redirect_to @vote_log, notice: 'Vote log was successfully created.' }
        format.json { render json: @vote_log, status: :created, location: @vote_log }
      else
        format.html { render action: "new" }
        format.json { render json: @vote_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vote_logs/1
  # PUT /vote_logs/1.json
  def update
    @vote_log = VoteLog.find(params[:id])

    respond_to do |format|
      if @vote_log.update_attributes(params[:vote_log])
        format.html { redirect_to @vote_log, notice: 'Vote log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vote_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_logs/1
  # DELETE /vote_logs/1.json
  def destroy
    @vote_log = VoteLog.find(params[:id])
    @vote_log.destroy

    respond_to do |format|
      format.html { redirect_to vote_logs_url }
      format.json { head :no_content }
    end
  end
end
