module Alohomora
  module Controllers
    module Helpers
      extend ActiveSupport::Concern
      
      included do
        helper_method :warden, :signed_in?
      end
      
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
      
      def authenticate!(opts={})
        warden.authenticate!(opts) #if !alohomora_controller? || opts.delete(:force)
      end

      # Return true if it's a alohomora_controller. false to all controllers unless
      # the controllers defined inside devise. Useful if you want to apply a before
      # filter to all controllers, except the ones in alohomora:
      def alohomora_controller?
        false
      end
    end
  end
end