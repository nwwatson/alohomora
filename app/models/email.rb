class Email < ActiveRecord::Base
  
  belongs_to :organization
  belongs_to :user
  
  validates :address, :uniqueness => true, :email_format => true 
  
end
