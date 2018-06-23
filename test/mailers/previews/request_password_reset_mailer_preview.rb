# Preview all emails at http://localhost:3000/rails/mailers/request_password_reset_mailer
class RequestPasswordResetMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/request_password_reset_mailer/notify
  def notify
    RequestPasswordResetMailer.notify
  end

end
