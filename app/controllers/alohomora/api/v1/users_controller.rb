class Alohomora::Api::V1::UsersController < ApplicationController
  respond_to :json
  before_filter :authenticate!, :organization_authorization!

  def index
    @users = User.users_for_organization(params[:organization_id])
  end
  
  
end