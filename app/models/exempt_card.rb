class ExemptCard < Card
  include Mongoid::Document
  
  embedded_in :user, :inverse_of => :exempt_cards
  embeds_many :exempt_days
  accepts_nested_attributes_for :exempt_days
  
end
