require 'warden'
module Alohomora
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
    
    # Initialize Warden and copy its configurations.
    initializer "alohomora.add_middleware" do |app|
      app.config.app_middleware.use Warden::Manager do |manager|
        manager.default_strategies :password_authenticatable
        manager.failure_app = lambda { |env| SessionsController.action(:new).call(env) }
      end
    end

    initializer "alohomora.extend.action_controller" do |app|
      ActionController::Base.send(:include, Alohomora::Controllers::Helpers)
    end
  end
  
  # This serializes the user in to session for future use
  Warden::Manager.serialize_into_session do |user|
    user.id
  end

  # This gets the current user information from session
  Warden::Manager.serialize_from_session do |id|
    User.find(id)
  end  

  # This is executed every time the user is authenticated (first time in each session).
  Warden::Manager.after_authentication do |user,auth,opts|

  end
end

