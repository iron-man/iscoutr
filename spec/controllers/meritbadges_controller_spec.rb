require 'spec_helper'

describe MeritbadgesController do
  include Devise::TestHelpers
  render_views

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
  
  describe "GET 'meritbadge list' via xml" do
    before(:each) do
      @attr = { :name => "Art" }
      @meritbadge = Meritbadge.create!(@attr)
      @meritbadges = Meritbadge.all
    end
    
    it "should have a list of meritbadges" do
      get 'index', :format => "xml"
      response.content_type.should eq("application/xml")
      response.should have_selector("meritbadges[type='array']")
      response.should have_selector("meritbadge > id")
      response.should have_selector("meritbadge > name")
      response.should have_selector("meritbadge > removed-date")
      response.should have_selector("meritbadge > required")
      response.should have_selector("meritbadge > requirements-path")
      response.should have_selector("meritbadge > requirements-text")
    end
  end
  
end