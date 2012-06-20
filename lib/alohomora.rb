require 'active_support/core_ext/numeric/time'
require 'active_support/dependencies'
require 'warden'

module Alohomora
  
end

require "alohomora/controllers/helpers"
require "alohomora/strategies/password_authenticatable"
require "alohomora/validators/url_validator"
require "alohomora/validators/email_format_validator"
require "alohomora/engine"
