class UpdateCardsDays < ActiveRecord::Migration
  def self.up
    add_column :cards, :week_starting, :date
    add_column :days, :notes, :string
  end

  def self.down
    delete_column :cards, :week_of
    delete_column :days, :notes
  end
end
