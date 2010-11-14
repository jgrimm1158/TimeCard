class AddReferences < ActiveRecord::Migration
  def self.up
    # remove_column :users, :department_id
    # remove_column :cards, :user_id
    # remove_column :days, :card_id
    # remove_column :departments, :manager_id
    # 
    # add_column :users, :reference, :department
    # add_column :cards, :reference, :user
    # add_column :days, :reference, :card
    # add_column :departments, :reference, :manager
  end

  def self.down
  end
end
