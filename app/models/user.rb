class User < ActiveRecord::Base
  #attr_accessible :email, :password, :password_confirmation, :emails_attributes, :organizations_attributes
  
  has_and_belongs_to_many :organizations
  has_many :emails
  
  validates :password, :presence => true, :on => :create#, :password_format => true
  
  accepts_nested_attributes_for :emails, :organizations
  
  has_secure_password
  
  before_create :generate_verification_code
  after_create :send_verification_email
  
  def full_name
    first_name + " " + last_name
  end
  
  private 
    
    def generate_verification_code
      self.verification_code = Digest::SHA1.hexdigest([Time.now, rand].join)
    end
    
    def send_verification_email
      logger.info "WHAT UP HOMIE ******************************************************"
      logger.info "BANG! No Error: #{self.errors.count.to_s}" if self.errors.empty? 
      #VerificationMailer.verification_email(self, self.emails[0]) if self.errors.empty?
    end
  

end
