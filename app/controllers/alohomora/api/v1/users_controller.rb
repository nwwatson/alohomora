class Alohomora::Api::V1::UsersController < ApplicationController
  respond_to :json
  before_filter :authenticate!, :organization_authorization!
  
  def index
    @users = User.get_accessible(params[:organization_id], current_user)
  end
  
  def show
    @user = User.get_accessible(params[:organization_id], current_user).find(params[:id])
  end
  
  def create
    make_attributes_hash(:user, [:addresses, :phone_numbers, :websites])
    
    @user = User.new(params[:user])
    @user.organization_id = params[:organization_id]
    
    if @user.save
      respond_with(@user, :responder => IMgmtBook::Responder)
    else
      render :json => { :success => false, :errors => @user.errors }, :status => :unprocessable_entity
    end

  end
  
  
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      respond_with(@user, :responder => IMgmtBook::Responder)
    else
      render :json => { :success => false, :errors => @user.errors }, :status => :unprocessable_entity
    end
  end
  
  def destroy
    begin
      @user = User.get_accessible(params[:organization_id], current_user).find(params[:id])
      @user.destroy
      return render :json => {:success => true }, :status => 200
    rescue
      return render :json => {:success => false, :errors => ["Unable to delete user"]}, :status => 401
    end
  end
end