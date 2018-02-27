module Api
  module V1
    class MemberAttendancesController < AuthorizationsController

      def create
        user = User.find_by!(code: member_attendance_params[:code])
        render json: NewAttendanceService.new(user, MembershipType.find(member_attendance_params[:membership_id])).perform

      rescue Exception => e
        render json: {notice: {detail: "Korisnik ne postoji!"}}
      end

      def index
        respond_with :api, :v1, json:  MemberAttendance.all, each_serializer: MemberAttendanceSerializer
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
