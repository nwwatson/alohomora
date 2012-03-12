class SessionsController < ApplicationController
  def new
  end

  def create
  end
  
  def destroy
    env['warden'].logout
    redirect_to root_url, notice: "Logged out!"
  end
end
