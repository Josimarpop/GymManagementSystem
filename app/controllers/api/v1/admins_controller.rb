#module Api
#  module V1
#    class AdminsController < ApplicationController
#      respond_to :json
#
#      def create
#        Admin.create!(admin_params)
#      end
#
#      private
#
#     def admin_params
#        params.require(:admin).permit(:id, :username, :password, :email)
#      end
#    end
#  end
#end
