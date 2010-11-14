class RestoreCardId < ActiveRecord::Migration
  def self.up
    add_column :days, :card_id, :integer
  end

  def self.down
  end
end
