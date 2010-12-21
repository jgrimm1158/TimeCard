class User
  include Mongoid::Document         
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]
  
  def self.find_for_database_authentication(conditions)
    value = conditions[authentication_keys.first]
    self.any_of({ :login => value }, { :email => value }).first
  end 
  
  field :login
  field :first_name
  field :last_name
  field :cards
  field :is_exempt, :type => Boolean
  key :first_name, :last_name
  # Validations :::::::::::::::::::::::::::::::::::::::::::::::::::::


  validates_presence_of :login
  validates_uniqueness_of :login, :case_sensitive => false
  attr_accessible :first_name, :last_name, :email, :login, :is_exempt, :password, :password_confirmation
 
  # Assocations :::::::::::::::::::::::::::::::::::::::::::::::::::::
  referenced_in :department, :inverse_of => :users
  references_many :cards
    
  def manager
    Manager.find(:first, :conditions => {:department_id => self.department.id})
  end
  # Callbacks ::::::::::::::::::::::::::::::::::::::::::::::::::::::: 
  # before_create :your_model_method
  # after_create :your_model_method
  # before_update :your_model_method
  
end
