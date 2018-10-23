module AlohomoraConcern
  extend ActiveSupport::Concern

  included do
    include Authenticate
    include CurrentConcern
    include SetCurrentRequestDetails
  end
end
