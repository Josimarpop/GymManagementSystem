module Api
  module V1
    class NotesController < ApplicationController


      def create
        note = Note.create!(note_params)

        respond_with :api, :v1, json: note, on_error: {
            status: :bad_request, detail: 'Pogreška pri kreiranju zabilješke!'
        }
      end

      def index
        respond_with :api, :v1, json: Note.all
      end

      def destroy
        User.find(note_params[:id]).destroy
        render json: 'Zabilješka je uspješno izbrisana.'
      end

      private
      def note_params
        params.require(:note).permit(:id, :body, :author)
      end

    end
  end
end