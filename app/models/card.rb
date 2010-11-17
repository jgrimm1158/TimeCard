class Card
  include Mongoid::Document
  
  embedded_in :user, :inverse_of => :cards
  embeds_many :days
  accepts_nested_attributes_for :days
    
  def after_create
    self.isExempt = self.user.exempt
    self.week_starting.step(self.week_starting.end_of_week - 2) do |date|
      if self.isExempt
        ExemptDay.create(:date => date, :card => self)
      else
        HourlyDay.create(:date =>date, :card => self)
      end 
    end
    self.save
  end
end
                   