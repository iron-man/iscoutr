class Scouter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :age, :phone, :troop_number
  
  has_and_belongs_to_many :scout_master
  has_many :scout_masters
  has_many :meritbadges
  has_many :requirements, :through => :meritbadges
  
  validates :name, :presence => true
  
end
