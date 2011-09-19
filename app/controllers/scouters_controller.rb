class ScoutersController < ApplicationController
  # GET /scouters
  # GET /scouters.xml
  def index
    @scouters = Scouter.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scouters }
    end
  end

  def enroll
    @scouter_id = params[:scouter_id]
    @meritbadge_id = params[:meritbadge_id]
    reqs = Requirement.find_all_by_meritbadge_id(@meritbadge_id)
    temp = reqs.map {|t| t.designation}
    return_array = []
    temp.each do |req|
      return_array << req.slice(/(\d)+/)
      return_array.uniq!
    end
    
    req_a_hash = []
    return_array.each do |req|
      req_a_hash << {req.to_s => {:text => "", :goal => "", :completed_date => ""}}
    end
    
    requirements_hash = {@meritbadge_id => req_a_hash}
    
    # status = ScouterMeritbadges.find_or_create_by_scouter_id_and_meritbadge_id(:scouter_id => @scouter_id, :meritbadge_id => @meritbadge_id)
    
    status = ScouterMeritbadges.find_or_create_by_scouter_id_and_meritbadge_id(:scouter_id => @scouter_id, :meritbadge_id => @meritbadge_id, :requirements => requirements_hash)
    flash[:notice] = "You have been enrolled!"
    # redirect_to :controller => "scouters", :action => "show", :id => params[:scouter_id]
    respond_to do |format|
      format.html {redirect_to :controller => "scouters", :action => "show", :id => params[:scouter_id]}
      format.js 
    end
  end

  # GET /scouters/1
  # GET /scouters/1.xml
  def show
    @scouter = Scouter.find(params[:id])
    @meritbadges = Meritbadge.find(:all, :conditions => "removed_date IS NULL", :order => "name ASC, removed_date ASC")
    @status = ScouterMeritbadges.find_all_by_scouter_id(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @scouter }
    end
  end

  # GET /scouters/new
  # GET /scouters/new.xml
  def new
    @scouter = Scouter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @scouter }
    end
  end

  # GET /scouters/1/edit
  def edit
    @scouter = Scouter.find(params[:id])
  end

  # POST /scouters
  # POST /scouters.xml
  def create
    @scouter = Scouter.new(params[:scouter])

    respond_to do |format|
      if @scouter.save
        format.html { redirect_to(@scouter, :notice => 'Scouter was successfully created.') }
        format.xml  { render :xml => @scouter, :status => :created, :location => @scouter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @scouter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scouters/1
  # PUT /scouters/1.xml
  def update
    @scouter = Scouter.find(params[:id])

    respond_to do |format|
      if @scouter.update_attributes(params[:scouter])
        format.html { redirect_to(@scouter, :notice => 'Scouter was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scouter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scouters/1
  # DELETE /scouters/1.xml
  def destroy
    @scouter = Scouter.find(params[:id])
    @scouter.destroy

    respond_to do |format|
      format.html { redirect_to(scouters_url) }
      format.xml  { head :ok }
    end
  end
end
