module Resolvers
  class ShowDetailsOfCurrentUser < GraphQL::Schema::Resolver
    description "Show details of current user"

    type Types::UserType, null: false

    def resolve(**args)
      Helpers::Authenticate.new.call(context: context)
      id = context[:current_user].id
      Contexts::Users::Queries::ShowDetailsOfCurrentUser.new.call(id: id)
    rescue ActiveRecord::RecordNotFound => error
      raise GraphQL::ExecutionError, error.message
    end
  end
end
