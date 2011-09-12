class MeritbadgesController < ApplicationController
  # GET /meritbadges
  # GET /meritbadges.xml
  def index
    @meritbadges = Meritbadge.find(:all, :order => "name ASC, removed_date ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meritbadges }
    end
  end
  
  def enroll
    status = ScouterMeritbadges.find_or_create_by_scouter_id_and_meritbadge_id(:scouter_id => params[:scouter_id], :meritbadge_id => params[:meritbadge_id])
    flash[:notice] = "You have been enrolled!"
    redirect_to :controller => "scouters", :action => "show", :id => params[:scouter_id]
  end

  # GET /meritbadges/1
  # GET /meritbadges/1.xml
  def show
    @meritbadge = Meritbadge.find(params[:id])
    @requirements = Requirement.find_all_by_meritbadge_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @meritbadge }
    end
  end

  # GET /meritbadges/new
  # GET /meritbadges/new.xml
  def new
    @meritbadge = Meritbadge.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @meritbadge }
    end
  end

  # GET /meritbadges/1/edit
  def edit
    @meritbadge = Meritbadge.find(params[:id])
    @requirements = Requirement.find_all_by_meritbadge_id(params[:id])
    
  end

  # POST /meritbadges
  # POST /meritbadges.xml
  def create
    @meritbadge = Meritbadge.new(params[:meritbadge])

    respond_to do |format|
      if @meritbadge.save
        format.html { redirect_to(@meritbadge, :notice => 'Meritbadge was successfully created.') }
        format.xml  { render :xml => @meritbadge, :status => :created, :location => @meritbadge }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @meritbadge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /meritbadges/1
  # PUT /meritbadges/1.xml
  def update
    @meritbadge = Meritbadge.find(params[:id])

    respond_to do |format|
      if @meritbadge.update_attributes(params[:meritbadge])
        format.html { redirect_to(@meritbadge, :notice => 'Meritbadge was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @meritbadge.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /meritbadges/1
  # DELETE /meritbadges/1.xml
  def destroy
    @meritbadge = Meritbadge.find(params[:id])
    @meritbadge.destroy

    respond_to do |format|
      format.html { redirect_to(meritbadges_url) }
      format.xml  { head :ok }
    end
  end
end
