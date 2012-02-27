require 'generators/alohomora'
require 'rails/generators/migration'

module Alohomora
  module Generators
    class InstallGenerator < Base
      include ::Rails::Generators::Migration
      
      def copy_initializers
        copy_file 'alohomora.rb', 'config/initializers/alohomora.rb'
      end
      
      def add_gems
        add_gem "rails", "~> 3.2.1"
        add_gem "warden", "~> 1.1.1"
        add_gem "bcrypt-ruby", "~> 3.0"
      end
      
      def add_alohomora_routes
        #route %Q(match "/register", to: "identities#new", :as => "register")
      end
      private
      
        def self.next_migration_number( dirname )
          next_migration_number = current_migration_number(dirname) + 1
          if ActiveRecord::Base.timestamped_migrations
            [Time.now.utc.strftime("%Y%m%d%H%M%S%6N"), "%.20d" % next_migration_number].max
          else
            "%.3d" % next_migration_number
          end
        end
    end
  end
end