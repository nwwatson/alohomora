module Alohomora
  module Concerns
    module HasAccount
      extend ActiveSupport::Concern

      included do
        belongs_to :account
      end
    end
  end
end
