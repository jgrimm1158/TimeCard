# class ExemptDay < Day
#   enum_values = [:worked, :PTO, :half_PTO, :did_not_work, :paid_holiday]
#   symbolize :worked, :in => enum_values
#   validates_inclusion_of :worked, :in => enum_values
#   
#   default_value_for :worked, :worked
#   
#   def after_create
#     self.worked = :worked
#     self.save
#   end
#   
# end
#                                                           