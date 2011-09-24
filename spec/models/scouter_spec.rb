require "spec_helper"
  
describe Scouter do
  before(:each) do
      @attr = { :name => "john", :email => "jdoe@example.com" }
  end
  
  it "should return a valid scouter" do
    scouter = Scouter.new(@attr.merge(:password => "test123"))
    scouter.name.should == 'john'
    scouter.email.should == 'jdoe@example.com'
    scouter.should be_valid
  end
  
  it "should not create a valid scouter without a name" do
    scouter = Scouter.new(@attr.merge(:name => nil, :password => "test123"))
    scouter.should_not be_valid
  end
  
  it "should not create a valid scouter without an email" do
    scouter = Scouter.new(@attr.merge(:email => nil))
    scouter.should_not be_valid
  end
  
  it "should not create a valid scouter without a password" do
    scouter = Scouter.new(@attr)
    scouter.should_not be_valid
  end
  
  it "should not create a scouter that is not unique" do
    scouter = Scouter.create!(@attr.merge(:password => "test123"))
    new_scouter = Scouter.new(@attr.merge(:password => "test123"))
    new_scouter.should_not be_valid
  end 
  
  it "should not create a user with a password less than 6 characters" do
    new_scouter = Scouter.new(@attr.merge(:password => "test1"))
    new_scouter.should_not be_valid
  end
  
  it "should not create a user with an invalid email" do
    new_scouter = Scouter.new(@attr.merge(:email => "bob", :password => "test1"))
    new_scouter.should_not be_valid
  end 
  

  describe "password encryption" do
    before(:each) do
      @scouter = Scouter.create!(@attr.merge(:password => "test123"))
    end

    it "should have an encrypted password attribute" do
      @scouter.should respond_to(:encrypted_password)
    end
    
    it "should set the encrypted password" do
      @scouter.encrypted_password.should_not be_blank
    end
  end
end

