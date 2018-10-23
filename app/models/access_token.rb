class AccessToken < ApplicationRecord
  include Alohomora::Concerns::Expirable,
          Alohomora::Concerns::HasJwtToken,
          Alohomora::Concerns::HasUser,
          Alohomora::Concerns::Revocable,
          Alohomora::Concerns::Verifiable


  belongs_to :user

  class << self

    def generate(user, exipry=Alohomora.authorization_token_exiry_in_minutes)
      AccessToken.create(user: user, expires_at: Time.now + exipry.minutes)
    end
  end
end
