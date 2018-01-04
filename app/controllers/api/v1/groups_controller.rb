module Api
  module Vi
    class GroupsController < ApplicationController

    def create
    end

    def index
      @groups = Group.all
      render json: @groups
    end

    def show
      @group = Group.find_by(group_params)
      render json: @groups
    end

    def edit
    end

    def destroy
    end

    #usergorups controler i primat oba ida od grupe i usera

      def group_params
        params.require(:groups).permit(:id, :name)
      end

     end
    end
end
