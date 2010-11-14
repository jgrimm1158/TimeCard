class RestoreUserId < ActiveRecord::Migration
  def self.up
    add_column :cards, :user_id, :integer
  end

  def self.down
  end
end
