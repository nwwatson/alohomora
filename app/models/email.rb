class Email < ActiveRecord::Base
  
  belongs_to :organization
  belongs_to :user
  
  validates :address, :uniqueness => true, :email_format => true
  
  before_create :generate_verification_code
  after_create :send_verification_email
  
  
  # Returns true if the user has been verified, false if they haven't been verified.
  def verified?
    !!verified_at
  end
  
  # Callback to overwrite if confirmation is required or not.
  def verification_required?
    !verified?
  end
  
  def active_for_authentication?
    (!confirmation_required? || confirmed? || confirmation_period_valid?)
  end
  
  # Begin Class Methods
  class << self
    
    # Verifies and email address
    def verifiy_email_address(address, code)
      email = Email.find_by_address(address)
      if email.verification_code.eql?(code)
        self.verification_token = nil
        self.verified_at = Time.now.utc
      end
    end
    
    # Get a email address with its corrisponding user
    def get_authentication_email(address)
      Email.joins(:user).where("address = ?", address).first
    end
    
  end
  # End Class Methods
  
  private
    
    # Generates an email verification code for the email address
    def generate_verification_code
      self.verification_code = Digest::SHA1.hexdigest([Time.now, rand].join)
    end
    
    # Sends an email to the email address with the verification code
    def send_verification_email
      logger.info "Errors are: #{self.errors.count}"
      VerificationMailer.verification_email(self) if self.errors.empty?
    end 
  
end
