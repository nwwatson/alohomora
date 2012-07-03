class User < ActiveRecord::Base
  attr_accessible :admin, :email, :name, :password, :password_confirmation, :uri, :organizations_attributes
  
  validates :password, :presence => true, :on => :create
  validates :email, presence: true
  validates :email, uniqueness: true
  
  has_and_belongs_to_many   :organizations, 
                            class_name: "Alohomora::Organization", 
                            join_table: "alohomora_organizations_users"
                            
  accepts_nested_attributes_for :organizations
  
  has_secure_password
  
  def admin?
    self.admin
  end
  
end
