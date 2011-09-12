class CreateScoutMasters < ActiveRecord::Migration
  def self.up
    create_table :scout_masters do |t|
      t.string :name
      t.integer :troop_number

      t.timestamps
    end
  end

  def self.down
    drop_table :scout_masters
  end
end
