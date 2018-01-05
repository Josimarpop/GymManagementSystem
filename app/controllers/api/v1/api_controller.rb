module Api
  module V1
    class ApiController < ApplicationController
      respond_to :json

      protected

      def configurate_permitted_parameters
        added_attrs = [:username, :email, :password, :password_confirmed, :remember_me]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      end
  end
  end
end


