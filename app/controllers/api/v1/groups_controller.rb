module Api
  module V1
    class GroupsController < AuthorizationsController

    def create
      group = Group.create!(group_params)

      respond_with :api, :v1, json: group, serializer: GroupSerializer, on_error: {
          status: :bad_request, detail: 'Pogreška kod kreiranja grupe! / Grupa već postoji!'
      }
    end

    def index
      respond_with :api, :v1, json: Group.all, serializer: GroupSerializer
    end

    def show
      respond_with :api, :v1, json: Group.find_by(group_params), serializer: GroupSerializer
    end

    def edit
      group = Group.find(group_params[:id])
      group.update(group_params)

      respond_with :api, :v1, json: group, serializer: GroupSerializer
    end

    def destroy
      Group.find_by(group_params).destroy
      render json: 'Grupa uspješno izbrisana'
    end


    private
      def group_params
        params.require(:groups).permit(:id, :name)
      end

     end
    end
end
