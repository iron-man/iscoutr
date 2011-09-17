class RemoveNameGoalCompletedCompletedDateColumnsFromRequirements < ActiveRecord::Migration
  def self.up
    remove_column :requirements, :name
    remove_column :requirements, :goal
    remove_column :requirements, :completed
    remove_column :requirements, :completed_date
  end

  def self.down
    add_column :requirements, :name, :string
    add_column :requirements, :goal, :text
    add_column :requirements, :completed, :boolean
    add_column :requirements, :completed_date, :date
  end
end
