class ScoutMaster < ActiveRecord::Base
  has_and_belongs_to_many :scouters
end
