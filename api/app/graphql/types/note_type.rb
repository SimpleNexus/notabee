module Types
  class NoteType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :source, String, null: true
    field :body, String, null: false
    field :created_at, String, null: false
  end
end
