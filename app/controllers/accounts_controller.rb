class AccountsController < ApplicationController
  def new
    @account = Account.new
    @account.emails.build
    @account.organizations.build
  end

  def create
    @account = Account.new(params[:account])
    if @account.save
      warden.set_user(@account)
      
      set_flash_message :signed_up_but_unconfirmed
      
      redirect_to accounts_verifiactions_url
    else
      render "new"
    end
  end
end
