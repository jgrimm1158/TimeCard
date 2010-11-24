class Card
  include Mongoid::Document
  
  field :week_starting, :type => Date
  field :is_submitted, :type => Boolean, :default => false
  field :is_approved, :type => Boolean, :default => false
  field :is_exempt, :type => Boolean, :default => false
  embeds_many :days
  referenced_in :user, :inverse_of => :cards
  accepts_nested_attributes_for :days
  
  validates_uniqueness_of :week_starting
    
  def create_days
    return if @days and @days.count >= 1;
    self.week_starting.step(self.week_starting.end_of_week - 2) do |date|
      day_class = self.is_exempt ? ExemptDay : HourlyDay
      self.days << day_class.new(:date => date)
      puts "MAKING DAY #{self.days.last.date}"
    end
    self.save
  end
  
  class << self
    
    def need_approval
      where :is_submitted => true, :is_approved => false
    end
    
    def exempt
        where :is_exempt => true
    end
    
    def hourly
      where :is_exempt => false
    end
  end
      
end
                   