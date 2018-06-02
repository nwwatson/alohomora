module TokenAuthentication
    extend ActiveSupport::Concern

    private

      def authenticate_with_token
        authenticated_user = User.fetch_by_token(authorization_header)
        authenticated_user ? authenticated(user) : request_token_authentication
      end

      def request_token_authentication
        if request.variant.native? || api_request?
          head :unauthorized
        end
      end

      def api_request?
        request.format.json?
      end

      def authorization_header
        request.headers['HTTP_AUTHORIZATION']
      end
end
