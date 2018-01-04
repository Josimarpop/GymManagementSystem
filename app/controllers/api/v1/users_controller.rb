module Api
  module V1
    class UsersController < AuthorizationsController
      respond_to :json

   def signin
    # membership i mailer posebni kontroleri ?
   end

  def create
    # new/save umjesto createa
    user = User.create(user_params)

    respond_with user, serializer: UserSerializer, on_error: {
        status: :bad_request, detail: 'Pogreška kod kreiranja korisnika! Username ili email već postoji!'
    }
    MembershipMailer.membership_renewal_email(user).deliver_now
  end

  def index
    render json: User.all
  end

  def show
   # binding.pry
    user = User.find_by(user_params)
    respond_with :api, :v1,json: user, serializer: UserSerializer
  end

  def edit
    respond_with User.find_by(user_params), serializer: UserSerializer
  end

  def update
    user = User.find_by(user_params)
    user.update(user_params)

    respond_with :api, :v1, user, serializer: UserSerializer
  end


  def destroy

  end

  private

  def user_params
    #dal da ovdje doma ubacim i grupu. NE nego u serializer
    params.require(:user).permit( :id, :first_name, :last_name, :email, :status)
  end

    end
  end
end
