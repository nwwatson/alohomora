module CookieAuthentication
  extend ActiveSupport::Concern

  private
    def authenticate_with_cookie
      authenticated_user = User.fetch_by_token(cookies.encrypted[:authentication_token])
      authenticated_user ? authenticated(user) : request_cookie_authentication
    end

    def request_cookie_authentication
      redirect_to new_session_url
    end

    def sign_in(access_token)
      cookies.encrypted[:authentication_token] = access_token.token
    end

    def sign_out
      cookies.delete :authentication_token
    end
end
