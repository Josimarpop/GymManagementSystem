module Api
  module V1
    class MemberAttendancesController < ApplicationController

      def create
      end

      def index
      end

      def destroy
      end
    end

    private

    def member_attendances_params
      params.require(:member_attendances).permit(:id, :created_at,)
    end

  end
end

