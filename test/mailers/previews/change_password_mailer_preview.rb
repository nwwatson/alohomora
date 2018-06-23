# Preview all emails at http://localhost:3000/rails/mailers/change_password_mailer
class ChangePasswordMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/change_password_mailer/notify
  def notify
    ChangePasswordMailer.notify
  end

end
