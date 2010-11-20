class Card
  include Mongoid::Document
  
  field :week_starting, :type => Date
  field :isSubmitted
  field :isApproved
  
  validates_uniqueness_of :week_starting
    
  def create_days
    return if @days and @days.count <= 0;
    self.week_starting.step(self.week_starting.end_of_week - 2) do |date|
      days = self.class == ExemptCard ? self.exempt_days : self.hourly_days
      day = days.create(:date => date)
      day.save
      puts "MAKING DAY #{day.date}"
    end
    self.save
  end
end
                   