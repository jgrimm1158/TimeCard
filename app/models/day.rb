class Day < ActiveRecord::Base
  belongs_to :card
  as_enum :worked, {:Worked => "Worked", :PTO => "PTO", :Half_PTO => "Half_PTO", :Did_Not_Work => "Did_Not_Work", :Paid_Holiday => "Paid_Holiday"}
  
  validates_inclusion_of :worked, :in => [:Worked, :PTO, :Half_PTO, :Did_Not_Work, :Paid_Holiday]

end