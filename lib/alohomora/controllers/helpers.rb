module Alohomora
  module Controllers
    module Helpers
      extend ActiveSupport::Concern
      
      included do
        helper_method :warden, :signed_in?
        helper_method :current_user
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
      
      # Checks to see if the user is a member of a given organization
      def member_of?(organization)
        current_user.organizations.where(:alohomora_organizations => {:id => org.id}).exists?
      end
      
      # Check to see if the current user is a member of the requested organization. By default
      # it looks for the organization_id in the params has. This is helpfult for APIs where
      # resources are nested under the organziation.
      def organization_authorization!(organization_id=params[:organization_id])
        unless current_user.organizations.where(:alohomora_organizations => {:id => organization_id}).exists?
          throw(:warden, :message => "User does not have access to the requested organization")
        end
      end
    
      # Authenticates a user. 
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
