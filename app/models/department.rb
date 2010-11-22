class Department
  include Mongoid::Document
  
  references_many :users, :inverse_of => :department
  references_one :manager
end
                                                              