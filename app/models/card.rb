class Card
  include Mongoid::Document
  
  field :week_starting, :type => Date
  field :is_submitted
  field :is_approved
  field :is_exempt
  embeds_many :days
  embedded_in :user, :inverse_of => :cards
  accepts_nested_attributes_for :days
  
  validates_uniqueness_of :week_starting
    
  def create_days
    return if @days and @days.count <= 0;
    self.week_starting.step(self.week_starting.end_of_week - 2) do |date|
      day_class = self.is_exempt ? ExemptDay : HourlyDay
      self.days << day_class.new(:date => date)
      puts "MAKING DAY #{self.days.last.date}"
    end
    self.save
  end
end
                   