class CreateDepartments < ActiveRecord::Migration
  def self.up
    create_table :departments do |t|
      t.string :name
      t.integer :manager_id
      
      t.timestamps
    end
    
    add_column :users, :manager, :boolean, :default => false
    add_column :users, :department, :integer
  end

  def self.down
    drop_table :departments
    remove_column :users, :manager
    remove_column :users, :department
  end
end
