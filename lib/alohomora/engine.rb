module Alohomora
  class Engine < ::Rails::Engine
    # Initialize Warden and copy its configurations.
    config.app_middleware.use Warden::Manager do |config|
      Alohomora.warden_config = config
    end
  end
end
