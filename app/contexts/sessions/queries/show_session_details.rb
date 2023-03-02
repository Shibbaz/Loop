module Contexts
  module Session
    module Queries
      class ShowSessionDetails
        def call(id:)
          session = Session.find(id)
          raise Contexts::Sessions::Errors::SessionNotFoundError unless user

          session
        end
      end
    end
  end
end
