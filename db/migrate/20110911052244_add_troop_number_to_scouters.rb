class AddTroopNumberToScouters < ActiveRecord::Migration
  def self.up
    add_column :scouters, :troop_number, :integer
  end

  def self.down
    remove_column :scouters, :troop_number
  end
end
