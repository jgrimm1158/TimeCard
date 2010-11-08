class CreateDays < ActiveRecord::Migration
  def self.up
    create_table :days do |t|
      t.date :date
      t.integer :hours_worked, :default => 0
      t.integer :hours_pto, :default => 0
      t.boolean :worked, :default => false
      t.boolean :pto, :default => false
      t.boolean :holiday, :default => false

      t.integer :card_id
       
      t.timestamps
    end
  end

  def self.down
    drop_table :days
  end
end
