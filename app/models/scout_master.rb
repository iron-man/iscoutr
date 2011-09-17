class ScoutMaster < ActiveRecord::Base
  has_and_belongs_to_many :scouters
  
  def claim_scout(scout_id)
    self.scouters << Scouter.find_by_id(scout_id)
  end
end
