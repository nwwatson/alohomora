class Account < ApplicationRecord
  include Alohomora::Concerns::HasCreator,
          Alohomora::Concerns::Slugable

  sluggable_field :name

  has_many :account_users
  has_many  :users, through: :account_users

  validates :name,
            :slug,
            presence: true


  validates :slug, uniqueness: true

  scope :for_current_user, -> { for_user(Current.user.id) }

  scope :for_user, ->(user_id) {
    joins(:account_users).where(
      account_users: { user_id: user_id }
    )
  }


  def to_param  # overridden
    slug
  end

  class << self
    def default_account_for(user)
      Account.joins(:account_users).where(account_users: { default: true}).find_by(account_users: { user_id: user.id })
    end
  end
end
