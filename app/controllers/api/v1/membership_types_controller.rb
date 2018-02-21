module Api
  module V1
    class MembershipTypesController < AuthorizationsController

      def index
        respond_with :api, :v1, json: MembershipType.all, each_serializer: MembershipTypeSerializer
      end

      def show
        membershipType = MembershipType.find(membership_type_params[:id])
        respond_with :api, :v1, json: membershipType, serializer: MembershipTypeSerializer
      end

      def edit
        membershipType = MembershipType.find(membership_type_params[:id])
        respond_with :api, :v1, json: membershipType, serializer: MembershipTypeSerializer
      end

      def create
        membershipType = MembershipType.create!(membership_type_params)

        respond_with :api, :v1, json: membershipType, serializer: MembershipTypeSerializer, on_error: {
            status: :bad_request, detail: 'Pogreška kod kreiranja članarine! / Članarina već postoji!'
        }
      end

      def update
        membershipType = MembershipType.find(membership_type_params[:id])
        membershipType.update(membership_type_params)

        respond_with :api, :v1, json: membershipType, serializer: MembershipTypeSerializer
      end


      def destroy
        MembershipType.find(membership_type_params[:id]).destroy
        render json: {notice: {detail: 'Članarina uspješno izbrisana!'}}
      end

      private

      # Never trust parameters from the scary internet, only allow the white list through.
      def membership_type_params
        params.require(:membership_type).permit(
            :id, :name, :max_week_attendance_restriction, :after_hour_restriction
        )
      end
    end
  end
end
