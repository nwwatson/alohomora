class AccessGrant < ApplicationRecord
  include Alohomora::Concerns::Expirable,
          Alohomora::Concerns::HasUser,
          Alohomora::Concerns::Revocable,
          Alohomora::Concerns::Verifiable


  has_secure_token :token

  validates :expires_at,
            presence: true

  belongs_to :user

  class << self

    def generate(user, exipry=Alohomora.access_grant_exiry_in_minutes)
      AccessGrant.create!(user: user, expires_at: Time.now + exipry.minutes)
    end

    def generate_and_notify(user, expiry)
      access_grant = AccessGrant.generate(user, expiry)
      AccessGrantMailer.notify(user, access_grant).deliver_now
    end

  end
end
