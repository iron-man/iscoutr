class AddColumnsToRequirements < ActiveRecord::Migration
  def self.up
    add_column :requirements, :meritbadge_id, :integer
    add_column :requirements, :designation, :string
  end

  def self.down
    remove_column :requirements, :designation
    remove_column :requirements, :meritbadge_id
  end
end
