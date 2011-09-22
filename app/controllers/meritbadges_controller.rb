class MeritbadgesController < ApplicationController
  # GET /meritbadges
  # GET /meritbadges.xml
  def index
    @meritbadges = Meritbadge.find(:all, :conditions => "removed_date IS NULL", :order => "name ASC, removed_date ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @meritbadges }
    end
  end

  # GET /meritbadges/1
  # GET /meritbadges/1.xml
  def show
    @meritbadge = Meritbadge.find(params[:id])
    # @requirements = Requirement.find_all_by_meritbadge_id(params[:id])
    @requirements = ScouterMeritbadges.find_by_meritbadge_id_and_scouter_id(params[:id], current_scouter)
    

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
    @requirements = ScouterMeritbadges.find_by_meritbadge_id_and_scouter_id(params[:id], current_scouter)
    
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

  def req_update
    @scouter_meritbadge = ScouterMeritbadges.find_by_scouter_id_and_meritbadge_id(current_scouter, params[:id])

    respond_to do |format|
      update_flag = false
      descriptions = params[:description].to_a
      goals = params[:goal].to_a
      completed_dates = params[:completed_date].to_a
      return_array = []
      descriptions.each_with_index do |num, index|
        designator = index+1
        return_array << {"designation" => designator, 
                         "description" => "#{descriptions[index][1].to_s}", 
                         "goal" => "#{goals[index][1].to_s}", 
                         "completed_date" => "#{completed_dates[index][1].to_s}"}
      end
            
     if  @scouter_meritbadge.update_attributes(:requirements => return_array)
       update_flag = true
     end  
      if update_flag
        flash[:notice] = 'Meritbadge was successfully updated.'
        format.html { redirect_to(:controller => 'meritbadges', :action => 'show', :id => params[:id]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @scouter_meritbadge.errors, :status => :unprocessable_entity }
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
