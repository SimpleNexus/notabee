module Types
  module Input
    class NoteDeleteInputType < Types::BaseInputObject
      argument :id, ID, required: true
    end
  end
end