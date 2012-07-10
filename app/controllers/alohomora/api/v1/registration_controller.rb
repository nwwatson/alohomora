class Alohomora::Api::V1::UsersController < ApplicationController
  respond_to :json
  before_filter :authenticate!, :organization_authorization!
  
  # This method creates a User with an organizaiton
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
      render :json => { :successs => true }, :status => :created
    else
      render :json => { :success => false, :errors => @user.errors }, :status => :unprocessable_entity
    end

  end
end