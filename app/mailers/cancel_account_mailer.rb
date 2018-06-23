class CancelAccountMailer < ApplicationMailer

  def notify(user)
    @user = user

    mail(
      to: @user.email,
      subject: I18n.t('cancel_account_mailer.notify.subject', name: @user.name)
    )
  end
end
