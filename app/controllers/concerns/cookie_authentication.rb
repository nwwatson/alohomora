module CookieAuthentication
  extend ActiveSupport::Concern

  private
    def authenticate_with_cookie
      authenticated_user = User.fetch_by_token(cookies.encrypted[:authentication_token])
      authenticated_user ? authenticated(authenticated_user) : request_cookie_authentication
    end

    def authenticate_cookie_without_redirect
      Rails.logger.debug "authenticate_cookie_without_redirect"
      authenticated_user = User.fetch_by_token(cookies.encrypted[:authentication_token])
      Rails.logger.debug authenticated_user
      authenticated(authenticated_user) if authenticated_user
    end

    def request_cookie_authentication
      redirect_to session_path
    end

    def sign_in(access_token)
      cookies.encrypted[:authentication_token] = access_token.token
    end

    def sign_out
      AccessToken.revoke(cookies.encrypted[:authentication_token])
      cookies.delete :authentication_token
    end
end
