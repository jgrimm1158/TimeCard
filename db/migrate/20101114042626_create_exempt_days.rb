class CreateExemptDays < ActiveRecord::Migration
  def self.up
    create_table :exempt_days do |t|
      t.string   :worked_cd,    :default => "Worked"
      t.timestamps
    end
    remove_column :days, :worked_cd
  end

  def self.down
    drop_table :exempt_days
    add_column :days, :worked_cd, :string, :default => "Worked"
  end
end
