module Api
  module V1
    class UsersController < AuthorizationsController
      respond_to :json

      def signin
        # membership i mailer posebni kontroleri ?
      end

      def create
        user = User.create!(user_params)

        respond_with :api, :v1, json: user, serializer: UserSerializer, on_error: {
            status: :bad_request, detail: 'Pogreška kod kreiranja korisnika! Username ili email već postoji!'
        }
        #MembershipMailer.membership_renewal_email(user).deliver_now
      end

      def index
        respond_with :api, :v1, json: User.all, each_serializer: UserSerializer
      end

      def show
        user = User.find_by(user_params)
        respond_with :api, :v1, json: user, serializer: UserSerializer
      end

      def edit
        user = User.find(user_params[:id])
        respond_with :api, :v1, json: user, serializer: UserSerializer
      end

      def update
        user = User.find(user_params[:id])
        user.update(user_params)

        respond_with :api, :v1, json: user, serializer: UserSerializer
      end

      def destroy
        User.find(user_params[:id]).destroy
        render json: 'Korisnik je uspješno izbrisan'
      end

      private

      def user_params
        params.require(:user).permit(:id, :first_name, :last_name, :email, :status, membership_type_ids: [])
      end

    end
  end
end
