class AddExemptToCard < ActiveRecord::Migration
  def self.up
    add_column :cards, :isExempt, :boolean, :default => false
  end

  def self.down
    remove_column :cards, :isExempt?
  end
end
