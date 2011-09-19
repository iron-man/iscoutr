require 'spec_helper'

describe ScoutersController do
  render_views
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
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
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should have_selector('h1', :content => 'All Scouts')
    end
  end
  
  
  # describe "GET 'index/1'" do
  #   it "should be successful" do
  #     get 'index/1'
  #     response.should be_success
  #   end
  # end
    
end