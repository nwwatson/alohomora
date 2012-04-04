class VerificationMailer < ActionMailer::Base
  
  def verification_email(email, resend=false)
    @email = email
    subject = ( resend ? "[#{t(:resend).upcase}] " : "")
    subject += I18n.t('alohomora.mailers.verification_mailer.subject')
    mail( :to => email.address,
          :subject => subject)
  end
  
end
