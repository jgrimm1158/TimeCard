class Card < ActiveRecord::Base
  belongs_to :user
  has_many :days, :dependent => :destroy
  accepts_nested_attributes_for :days
  
  protected
  
  def after_create
    self.isExempt = self.user.exempt
    self.week_starting.step(self.week_starting.end_of_week - 2) do |date|
      if self.isExempt
        puts ExemptDay.create(:date => date, :card => self, :worked => :worked).errors
      else
        puts "making hourly day"
        HourlyDay.create(:date =>date, :card => self)
      end 
    end
  end
end
