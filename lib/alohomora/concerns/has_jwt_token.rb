module Alohomora
  module Concerns
    module HasJwtToken
      extend ActiveSupport::Concern

      included do
        before_create :generate_token

        validates :expires_at, presence: true
      end

      private
        def generate_token
          self.token = JsonWebToken.encode( { exp: expires_at.to_i } )
        end
    end
  end
end
