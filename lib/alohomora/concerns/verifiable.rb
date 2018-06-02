module Alohomora
  module Concerns
    module Verifiable
      extend ActiveSupport::Concern

      def verified?
        !revoked? and !expired?
      end

    end
  end
end
