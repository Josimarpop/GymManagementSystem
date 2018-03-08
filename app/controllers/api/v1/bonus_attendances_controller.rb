module Api
  module V1
    class BonusAttendancesController < AuthorizationsController

      def create
        user = User.find(bonus_attendances_params[:user_id])
        render json: NewBonusAttendanceService.new(user).perform
      end
      
      private

      def bonus_attendances_params
        params.require(:bonus_attendance).permit(:user_id)
      end

    end
  end
end
