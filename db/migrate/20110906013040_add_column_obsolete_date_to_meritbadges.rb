class AddColumnObsoleteDateToMeritbadges < ActiveRecord::Migration
  def self.up
    add_column :meritbadges, :removed_date, :date
  end

  def self.down
    remove_column :meritbadges, :removed_date
  end
end
