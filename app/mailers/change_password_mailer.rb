class ChangePasswordMailer < ApplicationMailer

  def notify(user)
    @user = user
    mail(
      to: @user.email,
      subject: I18n.t('change_password_mailer.notify.subject', name: @user.name)
    )
  end
end
