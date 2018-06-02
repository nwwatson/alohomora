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


  scope :for_user, ->(user_id) {
    joins(:account_users).where(
      account_users: { user_id: user_id }
    )
  }
end
