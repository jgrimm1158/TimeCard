class Day
  include Mongoid::Document
  
  embedded_in :card, :inverse_of => :days
  
  
end                                    