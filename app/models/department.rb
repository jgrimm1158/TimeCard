class Department < ActiveRecord::Base
  has_many :users
  has_one :manager, :class_name => "User", :conditions => "manager = true"
end
