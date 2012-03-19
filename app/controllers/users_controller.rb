class UsersController < ApplicationController
  def new
    @user = User.new
    @user.emails.build
    @user.organizations.build
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      warden.set_user(@user)
      
      
      flash[:notice] = I18n.t("alohomora.users.signed_up_but_unconfirmed")
      
      redirect_to verifiactions_url
    else
      render "new"
    end
  end
end
