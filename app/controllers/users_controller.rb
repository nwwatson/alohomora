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
      
      set_flash_message :signed_up_but_unconfirmed
      
      redirect_to users_verifiactions_url
    else
      render "new"
    end
  end
end
