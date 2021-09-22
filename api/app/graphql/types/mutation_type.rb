module Types
  class MutationType < Types::BaseObject
    field :add_note, mutation: Mutations::AddNote
    field :delete_note, mutation: Mutations::DeleteNote
  end
end
