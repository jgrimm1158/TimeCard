class Manager < User
  include Mongoid::Document
  field :department, :type => Department
end
