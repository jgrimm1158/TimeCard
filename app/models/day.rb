class Day
  include Mongoid::Document
  
  referenced_in :card, :inverse_of => :days
  
  field :date, :type => Date
  field :notes, :default => ""
  field :worked, :default => "Worked"
  
  validates_uniqueness_of :date
  
end                                    