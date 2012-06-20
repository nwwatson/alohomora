Warden::Strategies.add(:password_authenticatable) do
  def valid?
    params['email'] && params['password']
  end
  
  def authenticate!
    email = Email.get_authentication_email(params['email'])
    if email && email.user.authenticate(params['password'])
      if email.verified?
        success! email.user
      else
        fail "Please verify your email address."
      end
    else
      fail "Invalid email or password"
    end
  end
end