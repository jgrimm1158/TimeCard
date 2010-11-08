class AddHalfPto < ActiveRecord::Migration
  def self.up
    add_column :days, :half_pto, :boolean
  end

  def self.down
    remove_column :days, :half_pto
  end
end
