module Alohomora
  module Controllers
    module Helpers
      extend ActiveSupport::Concern
      
      # mark methods as helper methods
      included do
        
      end
      
      module ClassMethods
        # The main accessor for the warden proxy instance
        def warden
          request.env['warden']
        end
        
        # Retrieves the current user in session
        def current_user
          warden.user
        end
         
      end
    end
  end
end