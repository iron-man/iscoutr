class AddRequirementsPathColumnToMeritbadges < ActiveRecord::Migration
  def self.up
    add_column :meritbadges, :requirements_path, :string
  end

  def self.down
    remove_column :meritbadges, :requirements_path
  end
end
