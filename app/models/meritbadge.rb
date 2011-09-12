class Meritbadge < ActiveRecord::Base
  has_many :requirements
  accepts_nested_attributes_for :requirements, :allow_destroy => true
end
