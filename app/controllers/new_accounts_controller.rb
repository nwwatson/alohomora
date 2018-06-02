class NewAccountsController < ApplicationController

  def show
    @new_account = NewAccount.new
  end

  def create
    @new_account = NewAccount.new(new_account_params)

    unless @new_account.save
      render :show
    end

    render status: :created
  end

  private

  def new_account_params
    params.require(:new_account).permit(
      :name,
      :email,
      :company
    )
  end

end
