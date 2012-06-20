class SessionsController < ApplicationController
  def failure
    return render :json => {:success => false, :errors => ["Login failed."]}, :status => 401
  end
end