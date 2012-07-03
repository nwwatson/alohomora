require 'warden'
module Alohomora
  class Engine < ::Rails::Engine
    isolate_namespace Alohomora
    engine_name 'alohomora'
    
    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
    end

    config.to_prepare &method(:activate).to_proc
    
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
    
    # Initialize Warden and copy its configurations.
    initializer "alohomora.add_middleware" do |app|
      app.config.app_middleware.use Warden::Manager do |manager|
        manager.default_strategies :password_authenticatable
        manager.failure_app = lambda { |env| Alohomora::SessionsController.action(:new).call(env) }
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

