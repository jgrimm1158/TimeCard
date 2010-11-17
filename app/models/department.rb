class Department
  include Mongoid::Document
  
  references_many :users
  references_one :manager, :class_name => "User", :conditions => "isManager = true"
end
                                                              