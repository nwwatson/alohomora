class ApplicationController < ActionController::Base
  protect_from_forgery
=begin  
  def warden
    request.env['warden']
  end
=end
end
