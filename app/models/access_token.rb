class AccessToken < ApplicationRecord
  include Alohomora::Concerns::Expirable,
          Alohomora::Concerns::HasUser,
          Alohomora::Concerns::Revocable,
          Alohomora::Concerns::Verifiable

  has_secure_token

  validates :expires_at,
            presence: true

  belongs_to :user

  class << self

    def generate(user, exipry=Alohomora.authorization_token_exiry_in_minutes)
      AccessToken.create(user: user, expires_at: Time.now + exipry.minutes)
    end

  end
end
