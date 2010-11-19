class HourlyCard
  include Mongoid::Document
  
  embedded_in :user, :inverse_of => :hourly_cards
  embeds_many :hourly_days
  accepts_nested_attributes_for :hourly_days  
end
