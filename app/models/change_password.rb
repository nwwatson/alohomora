class ChangePassword
  include ActiveModel::Model

  attr_accessor :password, :password_confirmation, :user

  validates :password, :length => { :minimum => 8 }, password_complexity: true
  validates :password_confirmation, presence: true
  validates_confirmation_of :password

  def save
    return false unless valid?

    @user.password = @password
    @user.password_confirmation = @password_confirmation
    unless @user.save
      return false
    end

    ChangePasswordMailer.notify(@user).deliver_now

    true
  end
end
