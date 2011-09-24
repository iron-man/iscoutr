require 'spec_helper'

describe ScoutMastersController do
  include Devise::TestHelpers
  render_views
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
  
end