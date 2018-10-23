class AccessesController < ApplicationController
  skip_before_action :authenticate_request, only: [:show, :create]

  def show
    @request_token = RequestAccessGrant.new
  end


  def create
    @request_token = RequestAccessGrant.new(request_token_params)
    @request_token.request!
  end

  private

  def request_token_params
    params.require(:request_access_grant).permit(:email)
  end
end
