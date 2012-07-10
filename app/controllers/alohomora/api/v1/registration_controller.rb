class Alohomora::Api::V1::UsersController < ApplicationController
  respond_to :json
  before_filter :authenticate!, :organization_authorization!
  
  # This method creates a Organization with user account within the system
  # {
  #   "email": "example@email.com"
  #   "name": "John Doe"
  #   "password": "changeME123"
  #   "password_confirmation": "changeME123"
  #   "organization": {
  #     "name": "Entropi Software LLC"
  #   }
  # }
  def create
    @user = User.new(params[:user])
    
    if @user.save
      respond_with(@user, :responder => ALohomora::Responder)
    else
      render :json => { :success => false, :errors => @user.errors }, :status => :unprocessable_entity
    end

  end
end