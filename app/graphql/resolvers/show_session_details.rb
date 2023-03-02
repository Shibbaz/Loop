module Resolvers
  class ShowSessionDetails < GraphQL::Schema::Resolver
    description "show details of session by id"
    argument :id, ID, required: true
    type Types::SessionType, null: false

    def resolve(**args)
      Helpers::Authenticate.new.call(context: context)
      Contexts::Sessions::Queries::ShowSessionDetails.new.call(id: args[:id])
    rescue ActiveRecord::RecordNotFound => error
      raise GraphQL::ExecutionError, error.message
    end
  end
end
