class AddImageUrlToMeritbadges < ActiveRecord::Migration
  def self.up
    add_column :meritbadges, :image_url, :string
  end

  def self.down
    remove_column :meritbadges, :image_url
  end
end
