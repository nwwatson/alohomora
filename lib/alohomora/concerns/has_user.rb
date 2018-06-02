module Alohomora
  module Concerns
    module HasUser
      extend ActiveSupport::Concern

      included do
        belongs_to :user
      end
    end
  end
end
