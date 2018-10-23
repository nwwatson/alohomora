module Authenticate
  extend ActiveSupport::Concern

  included do
    include CookieAuthentication, TokenAuthentication

    before_action :authenticate_request
    helper_method :valid_session?
  end

  def valid_session?
    Current.user.present? && Current.account.present?
  end

  private
    def authenticate_request
      if authenticate_with_cookie || authenticate_with_token
        # Do nothing, authenticated
      else
        request_token_authentication || request_cookie_authentication
      end
    end

    def authenticated(user)
      Current.user = user
    end

end
