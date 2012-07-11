class Alohomora::Api::V1::OrganizationsController < ApplicationController
  respond_to :json
  before_filter :authenticate!
  
  def index
    @organizations = Alohomora::Organization.order(:name)
  end
  
  def show
    @organization = Alohomora::Organization.get_organization_organziation(params[:id], current_organization)
  end
  
  
  def create
    @organization = Alohomora::Organization.new(params[:organization])
    
    if @organization.save
      respond_with(@organization, :responder => Alohomora::Responder)
    else
      render :json => { :success => false, :errors => @organization.errors }, :status => :unprocessable_entity
    end

  end
  
  
  def update
    @organization = Alohomora::Organization.find(params[:id])

    if @organization.update_attributes(params[:organization])
      respond_with(@organization, :responder => Alohomora::Responder)
    else
      render :json => { :success => false, :errors => @organization.errors }, :status => :unprocessable_entity
    end
  end
  
  def destroy
    begin
      @organization = Alohomora::Organization.get_accessible(params[:organization_id], current_organization).find(params[:id])
      @organization.destroy
      return render :json => {:success => true }, :status => 200
    rescue
      return render :json => {:success => false, :errors => ["Unable to delete organization"]}, :status => 401
    end
  end
  
  
end