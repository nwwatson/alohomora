class AccountUser < ApplicationRecord
  include Alohomora::Concerns::HasAccount,
          Alohomora::Concerns::HasUser

  enum role: [ owner: 1, user: 2 ]

  belongs_to :user

end
