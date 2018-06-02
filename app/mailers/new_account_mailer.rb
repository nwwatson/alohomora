class NewAccountMailer < ApplicationMailer
  def notify(user, access_grant)
    @user = user
    @access_grant = access_grant
    mail(to: @user.email, subject: "Your new Requollect account")
  end
end
