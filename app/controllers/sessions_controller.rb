class SessionsController < ApplicationController
  def show
    if user
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
