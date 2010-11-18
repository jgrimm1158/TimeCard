class User
  include Mongoid::Document         
  devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable
  
  # Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::

  field :login
  field :first_name
  field :last_name
  validates_presence_of :login
  validates_uniqueness_of :login, :email, :case_sensitive => false
  attr_accessible :first_name, :last_name, :email, :login, :exempt, :department, :password, :password_confirmation
 
  # Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
  referenced_in :department
  embeds_many :cards
  
  # Callbacks ::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
  # before_create :your_model_method
  # after_create :your_model_method
  # before_update :your_model_method
  
end
