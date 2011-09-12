class CreateRequirements < ActiveRecord::Migration
  def self.up
    create_table :requirements do |t|
      t.string :name
      t.text :description
      t.text :goal
      t.boolean :completed
      t.date :completed_date

      t.timestamps
    end
  end

  def self.down
    drop_table :requirements
  end
end
