class Scouter < ActiveRecord::Base
  has_and_belongs_to_many :scout_master
  has_many :scout_masters
  has_many :meritbadges
  has_many :requirements, :through => :meritbadges
end
