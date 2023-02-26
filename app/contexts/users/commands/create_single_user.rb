module Contexts
  module Users
    module Commands
      class CreateSingleUser
        def call(event)
          stream = event.data
          user = stream[:adapter].create!(
            name: stream[:name],
            email: stream[:email],
            password: stream[:password],
          )
        end
      end
    end
  end
end
