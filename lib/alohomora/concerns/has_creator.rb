module Alohomora
  module Concerns
    module HasCreator
      extend ActiveSupport::Concern

      included do
        belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id'
      end
    end
  end
end
