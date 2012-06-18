class User < ActiveRecord::Base
  attr_accessible :uri, :email, :password, :admin, :password_confirmation, :organizations_attributes
  
  has_and_belongs_to_many :organizations
  
  validates :password, :presence => true, :on => :create
  
  accepts_nested_attributes_for :organizations
  
  has_secure_password
  
  def admin?
    self.admin
  end
  
  # Begin Class Methods
  class << self
    
  end
  # End Class Methods
    
end
