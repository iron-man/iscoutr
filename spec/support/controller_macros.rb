module ControllerMacros
  # def login_admin
  #   before(:each) do
  #     @request.env["devise.mapping"] = Devise.mappings[:admin]
  #     sign_in Factory(:admin)
  #   end
  # end

  def login_scouter
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:scouter]
      @scouter = Factory(:scouter)
      # scouter.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
      sign_in @scouter
    end
  end
  
end