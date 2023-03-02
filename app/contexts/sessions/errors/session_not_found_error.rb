module Context
  module Sessions
    module Errors
      class SessionNotFoundError < ActiveRecord::RecordNotFound;
        def message
          "Session is not found"
        end
      end
    end
  end
end
