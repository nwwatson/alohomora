module Alohomora
  module Controllers
    module Helpers
      extend ActiveSupport::Concern
      
      def self.included(base)
        base.extend InstanceMethods 

        # mark methods as helper methods
        #helper_method :warden
      end
      
      module InstanceMethods
        # The main accessor for the warden proxy instance
        def warden
          request.env['warden']
        end
        
        # Retrieves the current user in session
        def current_user
          warden.user
        end
        
        # Returns True if the user is logged in, False if the user is logged out.
        def signed_in?
          warden.authenticate?
        end
        
        
        
      end
    end
  end
end