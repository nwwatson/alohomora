class User < ApplicationRecord
  include Alohomora::Validators

  has_many :access_grants, dependent: :destroy
  has_many :access_tokens, dependent: :destroy
  has_many :account_users
  has_many :accounts, through: :account_users

  # Validate Presence
  validates :name,
            :time_zone,
            presence: true

  validates :email, presence: true, email: true

  validates :password,
            length: { minimum: 8 },
            password_complexity: true,
            on: :create

  class << self
    def default_account
      joins(account_users: :account).find_by(account_users: { default: true })
    end

    def fetch_by_token(token)
      joins(:access_tokens).find_by(access_tokens: { token: token })
    end
  end

end
