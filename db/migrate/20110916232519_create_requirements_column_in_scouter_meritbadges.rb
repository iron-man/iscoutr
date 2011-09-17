class CreateRequirementsColumnInScouterMeritbadges < ActiveRecord::Migration
  def self.up
    add_column :scouter_meritbadges, :requirements, :text
  end

  def self.down
    remove_column :scouter_meritbadges, :requirements
  end
end
