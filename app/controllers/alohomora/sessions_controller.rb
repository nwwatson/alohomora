module Alohomora
  class SessionsController < ApplicationController
    def new
      flash.now.alert = warden.message if warden.message.present?
    end

    def create
      warden.authenticate!
      redirect_to root_url, notice: "Signed in successfully."
    end
  
    def destroy
      env['warden'].logout
      redirect_to root_url, notice: "Signed out successfully."
    end
    
    def failure
      return render :json => {:success => false, :errors => ["Login failed."]}, :status => 401
    end
  end
end