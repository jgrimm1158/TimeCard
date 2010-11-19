class Card
  include Mongoid::Document
  
  field :week_starting, :type => Date
    
  def create_days
    return if @days and @days.count <= 0;
    self.week_starting.step(self.week_starting.end_of_week - 2) do |date|
      if self.class == ExemptCard
        self.exempt_days.find_or_initialize_by(:date => date, :card => self)
      else
        self.hourly_days.find_or_initialize_by(:date => date, :card => self)
      end 
    end
    self.save
  end
end
                   