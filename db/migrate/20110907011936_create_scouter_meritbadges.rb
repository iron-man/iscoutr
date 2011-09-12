class CreateScouterMeritbadges < ActiveRecord::Migration
  def self.up
    create_table :scouter_meritbadges do |t|
      t.integer :scouter_id
      t.integer :meritbadge_id
      t.date :completed_date

      t.timestamps
    end
  end

  def self.down
    drop_table :scouter_meritbadges
  end
end
