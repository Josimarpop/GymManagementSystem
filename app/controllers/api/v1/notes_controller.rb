module Api
  module V1
    class NotesController < AuthorizationsController

      def create
        note = Note.create!(note_params)

        respond_with :api, :v1, json: note, serializer: NoteSerializer,  on_error: {
            status: :bad_request, detail: 'Pogreška pri kreiranju zabilješke!'
        }
      end

      def index
        respond_with :api, :v1, json: Note.all, each_serializer: NoteSerializer
      end

      def destroy
        Note.find(note_params[:id]).destroy
        render json: {notice: {detail: 'Zabilješka je uspješno izbrisana.'}}
      end

      private

      def note_params
        params.require(:note).permit(:id, :body, :author)
      end

    end
  end
end