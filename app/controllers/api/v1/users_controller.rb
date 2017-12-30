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
    render json: ('Pozdrav!').to_json
  end

  def edit

  end

  def update

  end

  private

  def user_params
    params.require(:user).permit( :username, :email, :password)
  end

    end
  end
end
