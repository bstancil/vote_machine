class HacksController < ApplicationController
  before_filter :redirect_to_active_hack, :except => [:show, :index]
  
  # GET /hacks
  # GET /hacks.json
  def index
    @hacks = Hack.order("created_at")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hacks }
    end
  end

  # GET /hacks/1
  # GET /hacks/1.json
  def show
    @hack = Hack.find(params[:id])
    @hacks = Hack.all
    @voters = Voter.all
    @departments = ['Analytics','Rails','WEB TEAM','Clients','Core Services','Infrastructure','Other','Product','UX']
    @vote_directions = Vote.select("id AS x,direction AS y").order("created_at").limit(40).to_json
    @vote_times = Vote.select("created_at").order("created_at").to_json

    respond_to do |format|
      format.html # show.html.erb}
      format.json { render json: @hack }
    end
  end

  # GET /hacks/new
  # GET /hacks/new.json
  def new
    @hack = Hack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hack }
    end
  end

  # GET /hacks/1/edit
  def edit
    @hack = Hack.find(params[:id])
  end

  # POST /hacks
  # POST /hacks.json
  def create
    @hack = Hack.new(params[:hack])

    respond_to do |format|
      if @hack.save
        format.html { redirect_to @hack, notice: 'Hack was successfully created.' }
        format.json { render json: @hack, status: :created, location: @hack }
      else
        format.html { render action: "new" }
        format.json { render json: @hack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hacks/1
  # PUT /hacks/1.json
  def update
    @hack = Hack.find(params[:id])

    respond_to do |format|
      if @hack.update_attributes(params[:hack])
        format.html { redirect_to @hack, notice: 'Hack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hacks/1
  # DELETE /hacks/1.json
  def destroy
    @hack = Hack.find(params[:id])
    @hack.destroy

    respond_to do |format|
      format.html { redirect_to hacks_url }
      format.json { head :no_content }
    end
  end
  
  def start
    @hack = Hack.find(params[:id])
    Hack.all_false_except(@hack)
    @hack.update_attributes(:start_time => Time.now)
     
    respond_to do |format|
       if @hack.save
         format.html { redirect_to hacks_path}
         format.json { render json: @hack, notice: 'Hack started.'}
       else
         format.html { render action: "edit" }
         format.json { render json: @hack.errors, status: :unprocessable_entity }
       end
     end
  end
  
  def end
    @hack = Hack.find(params[:id])
    @hack.update_attributes(:end_time => Time.now)
    @hack.update_attributes(:active_hack => false)

    respond_to do |format|
      if @hack.save
        format.html { redirect_to hacks_path, notice: 'Hack ended.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hack.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def limbo
  end
  
end
