require 'spec_helper'

describe ScoutersController do
  include Devise::TestHelpers
  render_views
  
  login_scouter  
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should have_selector('h1', :content => 'All Scouts')
      response.should be_success
    end    
  end
  
  describe "GET index" do
    it "assigns @scouters" do
      get :index
      @scouter.should_not be_nil
      assigns(:scouters).should_not be_nil 
    end
  end
  
  describe "GET 'index' and should have a current scouter" do
    it "should have a current_scouter" do
      subject.current_scouter.should_not be_nil
    end
  end  
  
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
 
  describe "GET 'new' with title" do
    it "should be successful" do
      get 'new'
      response.should have_selector('h1', :content => 'New scouter')
    end
  end 
  
  describe "GET 'show'" do
    before(:each) do
      @attr = { :name => "Art" }
      @meritbadge = Meritbadge.create!(@attr)
      @meritbadges = Meritbadge.all
    end
    
    it "should show a link to the logged in user's profile" do
      get 'show', :id => @scouter
      response.body.should contain(@scouter.name)
      response.body.should have_selector('span', :content => "Logged in as: #{@scouter.name}")
      response.body.should have_selector('a', :content => @scouter.name)
      response.body.should have_selector("span[id='logged_in_as'] > a[href='/scouters/#{@scouter.id}']")
    end
    
    it "should have a list of meritbadges" do
      get 'show', :id => @scouter
      response.body.should have_selector("table[id='meritbadge_list']")
      response.body.should have_selector("div[id='enroll_button_#{@scouter.id}_#{@meritbadge.id}']")
    end
    
    it "should respond to a click on the enroll button" do
      expect {
        post 'enroll', :scouter_id => @scouter.id, :meritbadge_id => @meritbadge.id
      }.to change{ScouterMeritbadges.count}.from(0).to(1)
      response.should redirect_to(:action => "show", :id => @scouter.id)
      flash[:notice].should eq("You have been enrolled!")      
    end
  end
  
  describe "GET 'scouters list' via xml" do
    it "should have a list of scouters" do
      get 'index', :format => "xml"
      response.content_type.should eq("application/xml")
      response.should have_selector("scouters[type='array']")
      response.should have_selector("scouter > age")
      response.should have_selector("scouter > email")
      response.should have_selector("scouter > name")
      response.should have_selector("scouter > phone")
      response.should have_selector("scouter > troop-number")
    end
  end
      
end