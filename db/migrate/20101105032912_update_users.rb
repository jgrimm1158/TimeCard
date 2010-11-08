class UpdateUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :exempt, :boolean, :default => false
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
  end

  def self.down
  end
end
