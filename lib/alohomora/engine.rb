require 'warden'
require 'alohomora/strategies/password_authenticatable'

module Alohomora
  class Engine < ::Rails::Engine
    # Initialize Warden and copy its configurations.
    initializer "alohomora.add_middleware" do |app|
      app.config.app_middleware.use Warden::Manager do |manager|
        manager.default_strategies :password_authenticatable
        manager.failure_app = lambda { |env| SessionsController.action(:new).call(env) }
      end
    end
    
  end
  
  Warden::Manager.serialize_into_session do |user|
    user.id
  end

  Warden::Manager.serialize_from_session do |id|
    Account.find(id)
  end  
end
