class NewAccount
  include ActiveModel::Model
  include Alohomora::Validators

  attr_accessor :name, :email, :company, :access_grant

  validates :name, presence: true
  validates :email,
            presence: true,
            email: true

  validate :unique_email_address

  def save
    return unless valid?

    ActiveRecord::Base.transaction do
      strong_password = SecureRandom.base64(20)

      user.name = name
      user.email = email
      user.password = strong_password
      user.password_confirmation = strong_password
      user.save!

      account.name = account_name
      account.active = true
      account.created_by = user
      account.save!

      account_user.user = user
      account_user.account = account
      account_user.default = true
      account_user.role = :owner
      account_user.save!
    end

    access_grant_notification
  end

  def token
    @access_grant.present? ? @access_grant.token : nil
  end

  private

  def access_grant_notification
    @access_grant = AccessGrant.generate(@user)
    NewAccountMailer.notify(@user, @access_grant).deliver_now
    return true
  end

  def unique_email_address
    if User.where(email: email).exists?
      errors.add(:email, "already has an account")
    end
  end

  def account_name
    company.present? ? company : name
  end

  def user
    @user ||= User.new
  end

  def account
    @account ||= Account.new
  end

  def account_user
    @membership ||= AccountUser.new
  end
end
