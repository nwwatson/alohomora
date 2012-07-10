class Api::Alohomora::V1::SessionsController < ApplicationController
  respond_to :json

  def create
    warden.authenticate!
    @user = current_user
  end
  
  def destroy
    env['warden'].logout
    return render :json => {:success => true }, :status => 200
  end
end