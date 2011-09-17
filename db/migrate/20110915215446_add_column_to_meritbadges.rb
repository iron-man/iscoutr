class AddColumnToMeritbadges < ActiveRecord::Migration
  def self.up
    add_column :meritbadges, :requirements_text, :text
  end

  def self.down
    remove_column :meritbadges, :requirements_text
  end
end
