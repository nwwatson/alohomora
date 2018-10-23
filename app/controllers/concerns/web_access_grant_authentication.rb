module WebAccessGrantAuthentication
  extend ActiveSupport::Concern

  private

    def authenticate_web_access_grant
      access_grant = AccessGrant.valid_token.find_by(token: params['token'])
      if access_grant && access_grant.user
        access_token = AccessToken.generate(access_grant.user)
        sign_in(access_token)
        authenticated(access_token.user)
        access_grant.revoke!
      else
        request_web_access_grant
      end
    end

    def request_web_access_grant
      redirect_to session_path
    end
end
