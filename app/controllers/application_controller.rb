require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  #before_action :authenticate_admin!

  protect_from_forgery prepend: true

end
