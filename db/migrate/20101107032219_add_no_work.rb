class AddNoWork < ActiveRecord::Migration
  def self.up
    add_column :days, :did_not_work, :boolean, :default => true
  end

  def self.down
    remove_column :days, :did_not_work
  end
end
