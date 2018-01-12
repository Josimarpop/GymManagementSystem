require 'factory_bot'
require 'support/authentication_helper'
require 'support/helpers'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include AuthenticationHelper, type: :controller
  config.include Helpers
end