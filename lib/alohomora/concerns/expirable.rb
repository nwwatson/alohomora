

module Alohomora
  module Concerns
    module Expirable
      # Indicates whether the object is expired (`#expires_in` present and
      # expiration time has come).
      #
      # @return [Boolean] true if object expired and false in other case
      def expired?
        Time.now.utc > expires_at
      end

      # Calculates expiration time in seconds.
      #
      # @return [Integer, nil] number of seconds if object has expiration time
      #   or nil if object never expires.
      def expires_in_seconds
        return nil if expires_in.nil?
        expires = expires_at - Time.now.utc
        expires_sec = expires.seconds.round(0)
        expires_sec > 0 ? expires_sec : 0
      end

      def expire_duration
        return ActiveSupport::Duration.build(expires_in)
      end
    end
  end
end
