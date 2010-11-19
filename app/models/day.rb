class Day
  include Mongoid::Document
  
  embedded_in :card, :inverse_of => :days
  
  field :date, :type => Date
  field :card
  
  
end                                    