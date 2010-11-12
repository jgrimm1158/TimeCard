class User < ActiveRecord::Base
  has_many :cards, :dependent => :destroy
  belongs_to :department
  
  has_one :manager, :through => :department
  
  validates :first_name,  :presence => true
  validates :last_name,  :presence => true
  validates :login,  :presence => true
  validates :email, :presence => true, :uniqueness => true, :email_format => true
  
  acts_as_authentic do |c|
    c.login_field = :login
    c. validate_login_field = false # There is no login field, so don't validate it
  end
end
