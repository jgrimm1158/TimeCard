class Department
  include Mongoid::Document
  
  references_many :users
  references_one :manager
end
                                                              