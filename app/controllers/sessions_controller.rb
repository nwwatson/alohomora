class SessionsController < ApplicationController
  include WebAccessGrantAuthentication

  before_action :authenticate_web_access_grant, only: [:show]
  skip_before_action :authenticate_request, only: [:show]

  def show
    if current_user
      redirect_to root_url
    else
      redirect_to access_path, alert: "Invalid sign in attempt"
    end
  end

  def destroy
    sign_out
    redirect_to root_url, notice: "Signed Out"
  end
end
