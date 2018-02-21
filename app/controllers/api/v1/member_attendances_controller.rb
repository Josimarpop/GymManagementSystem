module Api
  module V1
    class MemberAttendancesController < ApplicationController

      def create
        user = User.find(member_attendance_params[:code])
        render json: NewAttendanceService.new(user, member_attendance_params[:membership_id]).perform
      end

      def index
        respond_with :api, :v1, json:  MemberAttendance.all, serializer: UserSerializer
      end

      def destroy
        MemberAttendance.find(member_attendance_params[:id]).destroy
        render json: {notice: {detail: 'Član je uspješno izbrisan!'}}
      end

      private

      def member_attendance_params
        params.require(:member_attendance).permit(:id, :code, :membership_id)
      end

    end
  end
end
