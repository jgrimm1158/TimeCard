class AddReferences < ActiveRecord::Migration
  def self.up
    remove_column :users, :department_id
    remove_column :cards, :user_id
    remove_column :days, :card_id
    remove_column :departments, :manager_id
    
    add_column :users, :references, :department
    add_column :cards, :references, :user
    add_column :days, :references, :card
    add_column :departments, :references, :manager
  end

  def self.down
  end
end
