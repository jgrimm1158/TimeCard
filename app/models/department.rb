class Department < ActiveRecord::Base
  has_many :users
  has_one :manager, :class_name => "User", :conditions => "isManager = true"
end
