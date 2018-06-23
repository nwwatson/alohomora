class PasswordsController < ApplicationController
  def show
    @change_password = ChangePasswordForm.new
  end

  def create
    @user = Current.user
    @change_password = ChangePassword.new(password_params.merge!(user: @user))
    if @change_password.save
      redirect_to root_path, notice: I18n.t('messages.password.successful_password_change', name: @user.name)
    else
      render :show
    end
  end

  private

    def password_params
      params.require(:change_password).permit(:password, :password_confirmation)
    end
end
