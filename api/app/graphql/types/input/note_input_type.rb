module Types
  module Input
    class NoteInputType < Types::BaseInputObject
      argument :title, String, required: true
      argument :source, String, required: false
      argument :body, String, required: true
    end
  end
end
