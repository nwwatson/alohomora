class User < ActiveRecord::Base
  attr_accessible :admin, :email, :name, :password, :password_confirmation, :uri
  
  validates :password, :presence => true, :on => :create
  validates :email, presence: true
  validates :email, uniqueness: true
  
  has_secure_password
  
  def admin?
    self.admin
  end
  
end
