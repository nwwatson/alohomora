require 'alohomora/engine'
#require 'alohomora/validators/email_validator'
require 'alohomora/validators/password_complexity_validator'

module Alohomora
  mattr_accessor :email_from_address
  @@email_from_address = "from@example.com"

  mattr_accessor :session_expiry_in_minutes
  @@session_expiry_in_minutes = 30

  mattr_accessor :authorization_token_exiry_in_minutes
  @@authorization_token_exiry_in_minutes = 60*5

  mattr_accessor :access_grant_exiry_in_minutes
  @@access_grant_exiry_in_minutes = 10

  module Concerns
    autoload :Expirable,        'alohomora/concerns/expirable'
    autoload :HasAccount,       'alohomora/concerns/has_account'
    autoload :HasCreator,       'alohomora/concerns/has_creator'
    autoload :HasJwtToken,      'alohomora/concerns/has_jwt_token'
    autoload :HasUser,          'alohomora/concerns/has_user'
    autoload :Revocable,        'alohomora/concerns/revocable'
    autoload :Slugable,         'alohomora/concerns/slugable'
    autoload :Verifiable,       'alohomora/concerns/verifiable'
  end

  module Validators
    autoload :EmailValidator,   'alohomora/validators/email_validator'
    autoload :PasswordComplexityValidator, 'alohomora/validators/password_complexity_validator'
  end


end
