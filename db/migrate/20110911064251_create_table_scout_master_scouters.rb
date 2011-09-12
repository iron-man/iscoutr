class CreateTableScoutMasterScouters < ActiveRecord::Migration
  def self.up
    create_table :scout_masters_scouters, :id => false do |t|
      t.references :scout_master, :scouter
    end
  end

  def self.down
    drop_table :scout_masters_scouters
  end
end
