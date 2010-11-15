class User
  include Mongoid::Document         
  devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable
  
  # Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::

  field :name
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
  attr_accessible :name, :email, :password, :password_confirmation
 
  # Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
  # belongs_to :department
  # embeds_many :cards
  # embeds_one :model
  
  # Callbacks ::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
  # before_create :your_model_method
  # after_create :your_model_method
  # before_update :your_model_method
  
end
