require "alohomora/engine"
require 'active_support/core_ext/numeric/time'
require 'active_support/dependencies'

module Alohomora
  
=begin
  
  # Store scopes mappings.
  mattr_reader :mappings
  @@mappings = ActiveSupport::OrderedHash.new
  
  # Small method that adds a mapping to Devise.
  def self.add_mapping(resource, options)
    mapping = Devise::Mapping.new(resource, options)
    @@mappings[mapping.name] = mapping
    @@default_scope ||= mapping.name
    @@helpers.each { |h| h.define_helpers(mapping) }
    mapping
  end
=end
  
  # Private methods to interface with Warden.
  mattr_accessor :warden_config
  @@warden_config = nil
  @@warden_config_block = nil
  
  # The default scope which is used by warden.
  mattr_accessor :default_scope
  @@default_scope = nil
  
  # Sets warden configuration using a block that will be invoked on warden
  # initialization.
  #
  #  Devise.initialize do |config|
  #    config.allow_unconfirmed_access_for = 2.days
  #
  #    config.warden do |manager|
  #      # Configure warden to use other strategies, like oauth.
  #      manager.oauth(:twitter)
  #    end
  #  end
  def self.warden(&block)
    @@warden_config_block = block
  end

  # A method used internally to setup warden manager from the Rails initialize
  # block.
  def self.configure_warden! #:nodoc:
    @@warden_configured ||= begin
      warden_config.default_scope = Alohomora.default_scope
      warden_config.intercept_401 = false

      Devise.mappings.each_value do |mapping|
        warden_config.scope_defaults mapping.name, :strategies => mapping.strategies
      end

      @@warden_config_block.try :call, Alohomora.warden_config
      true
    end
  end
  
=end
end





require "warden"



