module Mutations
  class CreateSessionMutation < BaseMutation

    argument :start_at, GraphQL::Types::ISO8601DateTime, required: true
    argument :end_at, GraphQL::Types::ISO8601DateTime, required: true
    argument :notes, [String], required: true

    type Types::SessionType
    field :session, ::Types::SessionType, null: false
    field :status, Int, null: false

    def resolve(start_at:, end_at:, notes:)
      uuid = SecureRandom.uuid
      Contexts::Sessions::Repository.new.create_session(id: uuid, start_at: start_at, end_at: end_at, notes: notes)
      Session.find(id: uuid)
    end
  end
end
