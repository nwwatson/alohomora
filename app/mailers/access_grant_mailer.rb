class AccessGrantMailer < ApplicationMailer
  def notify(user, access_grant)
    @user = user
    @access_grant = access_grant
    mail(
      to: @user.email,
      subject: I18n.t('access_grant_mailer.notify.subject', name: @user.name)
    )
  end
end
