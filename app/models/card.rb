class Card < ActiveRecord::Base
  belongs_to :user
  has_many :days, :dependent => :destroy
  accepts_nested_attributes_for :days
end
