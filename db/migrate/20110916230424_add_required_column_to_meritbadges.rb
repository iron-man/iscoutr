class AddRequiredColumnToMeritbadges < ActiveRecord::Migration
  def self.up
    add_column :meritbadges, :required, :integer
  end

  def self.down
    remove_column :meritbadges, :required
  end
end
