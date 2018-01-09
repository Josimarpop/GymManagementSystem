module Api
  module V1
    class UserGroupsController < ApplicationController


      def show
        @group = Group.find(group_params[:id])
        @users = @group.users
        render json: @users
      end

      def create
        @group = Group.find(group_params[:id])
        @user = User.find(user_params[:id])

        if @group.users.include? @user
          render json: 'Korisnik već postoji u grupi!'
        else
          @group.users << @user
          render json: 'Korisnik je uspješno dadan u grupu!'
        end
      end

      def destroy
        @group = Group.find(group_params[:id])
        GroupHasUser.find_by(group_id: group_params[:id], user_id: user_params[:id]).delete
        render json: 'Korisnik je uspješno maknut iz grupe!'
      end

      private

      def user_params
        params.require(:user).permit(:id, :first_name, :last_name, :email, :status)
      end

      def group_params
        params.require(:group).permit(:id, :name)
      end

    end
  end
end
