class CreateHourlyDays < ActiveRecord::Migration
  def self.up
    add_column :days, :type, :string
    create_table :hourly_days do |t|
      t.integer :hours_worked, :default => 0
      t.integer :hours_PTO, :default => 0
      t.timestamps
    end
    remove_column :days, :hours_worked
    remove_column :days, :hours_pto
  end

  def self.down
    drop_table :hourly_days
    remove_column :days, :type
    add_column :hours_worked, :integer, :default => 0
    add_column :hours_PTO, :integer, :default => 0
  end
end
