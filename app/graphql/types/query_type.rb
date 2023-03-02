module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    field :show_details_of_current_user, resolver: ::Resolvers::ShowDetailsOfCurrentUser
    field :show_session_details, resolver: ::Resolvers::ShowSessionDetails

  end
end
