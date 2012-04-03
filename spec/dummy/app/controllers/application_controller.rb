class ApplicationController < ActionController::Base
  protect_from_forgery

  def warden
    request.env['warden']
  end

end
