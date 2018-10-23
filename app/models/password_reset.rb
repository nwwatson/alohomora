class PasswordReset
  include ActiveModel::Model
  include Alohomora::Validators

  attr_accessor :password_reset_token,
                :password,
                :password_confirmation

  # Passwords must have a minimum length of 8
  validates :password, :length => { :minimum => 8 }, password_complexity: true
  validates :password_confirmation, presence: true
  validates_confirmation_of :password

  def change
    return false unless valid?

    @user.password = @password
    @user.password_confirmation = @password_confirmation
    @user.password_reset_token = nil
    @user.reset_token_expires = nil

    unless @user.save
      return false
    end
    UserMailer.password_changed(@user).deliver
    true
  end
end
