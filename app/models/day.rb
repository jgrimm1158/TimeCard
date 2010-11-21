class Day
  include Mongoid::Document
  
  embedded_in :card, :inverse_of => :days
  
  field :date, :type => Date
  field :notes
  field :worked, :default => "Worked"
  
  validates_uniqueness_of :date
  
end                                    