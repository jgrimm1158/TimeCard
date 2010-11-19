class ExemptDay < Day
  include Mongoid::Document
  
  field :worked, :default => 'Worked'
  enum_values = ["Worked", "PTO", "Half PTO", "Did Not Work", "Paid Holiday"]
  validates_inclusion_of :worked, :in => enum_values
  
  
end
                                                          