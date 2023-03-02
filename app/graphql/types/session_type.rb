# frozen_string_literal: true

module Types
  class SessionType < Types::BaseObject
    field :id, ID, null: false
    field :start_at, GraphQL::Types::ISO8601DateTime, null: false
    field :end_at, GraphQL::Types::ISO8601DateTime, null: false
    field :notes, [String], null: false
  end
end
