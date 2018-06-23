class PasswordResetRequest
  include ActiveModel::Model

  PASSWORD_RESET_ACCESS_TOKEN_EXPIRY = 5

  attr_accessor :email

  validates :email, presence: true, email: true

  def reset
    return false unless valid?

    user = User.find_by email: email
    if user
      user.password = password
      user.password_confirmation = password
      user.require_password_reset = true

      if user.save
        access_grant = AccessGrant.generate(user, PASSWORD_RESET_ACCESS_TOKEN_EXPIRY)
        RequestPasswordResetMailer.notify(user, access_grant).deliver_now
      end
    end
    true
  end

  def password
    @password ||= "#{random_upper_letters}#{random_lower_letters}#{random_numbers}".scan(/\w/).shuffle.join
  end

  def random_upper_letters
    ('A'..'Z').to_a.shuffle[0,3].join
  end

  def random_lower_letters
    ('a'..'z').to_a.shuffle[0,3].join
  end

  def random_numbers
    (0..9).to_a.shuffle[0,2].join
  end
end
