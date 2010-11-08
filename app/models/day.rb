class Day < ActiveRecord::Base
  belongs_to :card
  as_enum :worked, {:worked => "worked", :pto => "pto", :half_pto => "half_pto", :did_not_work => "did_not_work", :paid_holiday => "paid_holiday"}
  
  validates_inclusion_of :worked, :in => [:worked, :pto, :half_pto, :did_not_work, :paid_holiday]

end