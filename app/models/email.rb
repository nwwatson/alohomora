class Email < ActiveRecord::Base
  
  belongs_to :organization
  belongs_to :user
  
  validates :address, :uniqueness => true, :email_format => true
  
  after_create :send_verification_email
  
  
  private
  
    def send_verification_email
      logger.info "Errors are: #{self.errors.count}"
      VerificationMailer.verification_email(self) if self.errors.empty?
    end 
  
end
