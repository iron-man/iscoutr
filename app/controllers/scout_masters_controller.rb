class ScoutMastersController < ApplicationController
  # GET /scout_masters
  # GET /scout_masters.xml
  def index
    @scout_masters = ScoutMaster.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scout_masters }
    end
  end

  # GET /scout_masters/1
  # GET /scout_masters/1.xml
  def show
    @scout_master = ScoutMaster.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scout_master }
    end
  end

  # GET /scout_masters/new
  # GET /scout_masters/new.xml
  def new
    @scout_master = ScoutMaster.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scout_master }
    end
  end

  # GET /scout_masters/1/edit
  def edit
    @scout_master = ScoutMaster.find(params[:id])
  end

  # POST /scout_masters
  # POST /scout_masters.xml
  def create
    @scout_master = ScoutMaster.new(params[:scout_master])

    respond_to do |format|
      if @scout_master.save
        format.html { redirect_to(@scout_master, :notice => 'Scout master was successfully created.') }
        format.xml  { render :xml => @scout_master, :status => :created, :location => @scout_master }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scout_master.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scout_masters/1
  # PUT /scout_masters/1.xml
  def update
    @scout_master = ScoutMaster.find(params[:id])

    respond_to do |format|
      if @scout_master.update_attributes(params[:scout_master])
        format.html { redirect_to(@scout_master, :notice => 'Scout master was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scout_master.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scout_masters/1
  # DELETE /scout_masters/1.xml
  def destroy
    @scout_master = ScoutMaster.find(params[:id])
    @scout_master.destroy

    respond_to do |format|
      format.html { redirect_to(scout_masters_url) }
      format.xml  { head :ok }
    end
  end
end
