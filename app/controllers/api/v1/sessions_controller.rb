module Api
  module V1
    class SessionsController < AuthorizationsController
      include Devise::Controllers::Helpers
      respond_to :jason

      skip_before_action :authenticate_admin_from_auth_token!, only: :create

      def create
        admin = Admin.find_by(username: session_params[:username])

        if admin && admin.valid_password?(session_params[:password])
          admin.regenerate_auth_token!
          respond_with :api, :v1, json: admin, serializer: AdminSerializer
        else
          render json: {notice: {detail: 'Ups! Upisali ste krivu lozinku ili email!'}, status: :bad_request}
        end
      end

      def destroy
        current_admin.regenerate_auth_token!
        render json: {notice: {detail: 'Korisnik je uspješno odjavljen!'}}
      end

      private

      def session_params
        params.require(:admin).permit(:username, :password)
      end

    end
  end
end
