class Api::V1::OrganizationsController < ApplicationController
  respond_to :json
  before_filter :authenticate!
  
  def index
    @organizations = Alohomora::Organization.order(:name)
  end
  
  def show
    @organization = Alohomora::Organization.get_user_organziation(params[:id], current_user)
  end
  
  
  
end