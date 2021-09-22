module Mutations
  class DeleteNote < Mutations::BaseMutation
    argument :params, Types::Input::NoteDeleteInputType, required: true

    field :note, Types::NoteType, null: false

    def resolve(params:)
      note_params = Hash params
      note = Note.find(note_params[:id])
      Note.destroy(note_params[:id])
      return { note: note }
    end
  end
end