class SessionsController < ApplicationController
  def failure
    return render:json => {:success => false, :errors => ["Login failed."]}
  end
end