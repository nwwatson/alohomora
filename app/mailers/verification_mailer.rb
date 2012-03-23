class VerificationMailer < ActionMailer::Base
  
  def verification_email(user, email, resend=false)
    @user = user
    subject = ( resend ? "[#{t(:resend).upcase}] " : "")
    subject += I18n.t('alohomora.mailers.verification_mailer.subject')
    mail( :to => email.address,
          :subject => subject)
  end
  
end
