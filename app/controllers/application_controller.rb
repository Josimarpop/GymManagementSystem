class ApplicationController < ActionController::Base
  #before_action :authenticate_admin!

  protect_from_forgery prepend: true

end
