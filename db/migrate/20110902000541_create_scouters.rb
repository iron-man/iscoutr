class CreateScouters < ActiveRecord::Migration
  def self.up
    create_table :scouters do |t|
      t.string :name
      t.string :email
      t.float :age
      t.string :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :scouters
  end
end
