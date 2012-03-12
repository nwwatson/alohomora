class AccountsController < ApplicationController
  def new
    @account = Account.new
    @account.emails.build
  end

  def create
    @account = Account.new(params[:account])
    if @account.save
      warden.set_user(@account)
      redirect_to root_url, notice: "Signed up!"
    else
      render "new"
    end
  end
end
