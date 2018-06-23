class RequestAccessGrant
  include ActiveModel::Model

  attr_accessor :email, :user, :access_grant

  validates :email, presence: true, email: true

  def request
    return unless valid?

    @user = User.find_by(email: email)
    if @user.present?
      AccessGrant.generate_and_notify(@user)
    else
      return false
    end

    return true
  end

  def token
    @access_grant ? @access_grant.token : nil
  end
end
