module Alohomora
  class UsersController < ApplicationController
    def new
      @user = User.new
      @user.organizations.build
    end

    def create
      @user = User.new(params[:user])
      if @user.save
        warden.set_user(@user)
        flash[:notice] = I18n.t("auth.users.registration_complete")
        redirect_to root_url
      else
        render "new"
      end
    end
    
    def complete
      
    end
  end
end