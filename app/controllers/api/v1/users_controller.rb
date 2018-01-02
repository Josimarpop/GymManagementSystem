module Api
  module V1
    class UsersController < AuthorizationsController


  def create
    user = User.create(user_params)

    respond_with user, serializer: UserSerializer, on_error: {
        status: :bad_request, detail: 'Pogreška kod kreiranja korisnika! Username ili email već postoji!'
    }
  end

  def index
    render json: User.all
  end

  def show
    binding.pry
    user = User.find_by(user_params)
    render json: user
  end

  def edit
    respond_with User.find_by(user_params), serializer: UserSerializer
  end

  def update
    user = User.find_by(user_params)
    user.update(user_params)

    respond_with user, serializer: UserSerializer
  end

  private

  def user_params
    params.require(:user).permit( :id, :first_name, :last_name, :email, :status)
  end

    end
  end
end
