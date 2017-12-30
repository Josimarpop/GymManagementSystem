module Api
  module V1
    class AuthorizationsController < ApiController
      include Devise::Controllers::Helpers
      before_action :authenticate_admin_from_auth_token!


      def authenticate_admin_from_auth_token!
        admin = authenticate_with_http_token do |token, options|
          admin = Admin.find_by(username: options['identifier'])
          admin if Devise.secure_compare(token, admin.auth_token) unless admin.blank?
        end
        respond_with(401, auth_error_message) if admin.blank?
        binding.pry
        #sing_in(admin, store: false)
      end



    def auth_error_message
      'Molimo Vas, prvo se ulogirajte kako bi nastavili.'
    end

    end
  end
end



