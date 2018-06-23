class NewAccountMailer < ApplicationMailer
  def notify(user, access_grant)
    @user = user
    @access_grant = access_grant
    mail(
      to: @user.email,
      subject: I18n.t('new_account_mailer.notify.subject', name: @user.name)
    )
  end
end
