class CancelAccountMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.cancel_account_mailer.notify.subject
  #
  def notify
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
