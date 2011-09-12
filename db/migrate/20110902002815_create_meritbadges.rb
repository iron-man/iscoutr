class CreateMeritbadges < ActiveRecord::Migration
  def self.up
    create_table :meritbadges do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :meritbadges
  end
end
