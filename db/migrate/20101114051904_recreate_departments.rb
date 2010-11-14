class RecreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.string :name
      t.integer :manager_id
      
      t.timestamps
    end
    
    add_column :users, :isManager, :boolean, :default => false
    add_column :users, :department_id, :integer
  end

  def self.down
    drop_table :departments
    remove_column :users, :isManager
    remove_column :users, :department_id
  end
end
