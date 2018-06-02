class AccessGrantMailer < ApplicationMailer
  def notify(user, access_grant)
    @user = user
    @access_grant = access_grant
    mail(to: @user.email, subject: "Sign-in link for Requollect")
  end
end
