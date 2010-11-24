class Department
  include Mongoid::Document
  
  references_many :users do
    def manager
      @target.select do |user|
        user.class == Manager
      end
    end
  end
end
                                                              