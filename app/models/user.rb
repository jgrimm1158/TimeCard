class User
  include Mongoid::Document         
  devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  
  def self.find_for_database_authentication(conditions)
    value = conditions[authentication_keys.first]
    self.any_of({ :login => value }, { :email => value }).first
  end
  
  # Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::

  field :login
  field :first_name
  field :last_name
  field :exempt_cards
  field :hourly_cards
  field :is_exempt
  validates_presence_of :login
  validates_uniqueness_of :login, :case_sensitive => false
  attr_accessible :first_name, :last_name, :email, :login, :is_exempt, :department, :password, :password_confirmation
 
  # Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
  referenced_in :department
  embeds_many :cards do
    def exempt
      @target.select do |card|
        card.isExempt == true
      end
    end
    def hourly
      @target.select do |card|
        card.isExempt == false
      end
    end
  end
  # Callbacks ::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
  # before_create :your_model_method
  # after_create :your_model_method
  # before_update :your_model_method
  
end
