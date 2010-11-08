class RemoveUserName < ActiveRecord::Migration
  def self.up
    remove_column :users, :name
    add_column :users, :login, :string
  end

  def self.down
  end
end
