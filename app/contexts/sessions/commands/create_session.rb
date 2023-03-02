module Contexts
  module Sessions
    module Commands
      class CreateSession
        def call(event)
          stream = event.data
          session = stream[:adapter].create!(
            id: SecureRandom.uuid,
            start_at: stream[:start_at],
            end_at: stream[:end_at],
            notes: stream[:notes]
          )
        end
      end
    end
  end
end
