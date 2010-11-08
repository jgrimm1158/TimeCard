class CreateEnums < ActiveRecord::Migration
  def self.up
    remove_column :days, :worked
    add_column :days, :worked, :enum, :limit => [:worked, :PTO, :half_PTO, :did_not_work, :paid_holiday]
  end

  def self.down
  end
end
