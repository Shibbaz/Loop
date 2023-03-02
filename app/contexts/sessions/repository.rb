module Contexts
  module Sessions
    class Repository
      attr_reader :adapter

      def initialize(adapter: Module::Session)
        @adapter = adapter
      end

      def create_session(start_at:, end_at:, notes:)
        event = SessionWasCreated.new(data: {
                                     start_at: start_at,
                                     end_at: end_at,
                                     notes: notes,
                                     adapter: @adapter
                                   })
        $event_store.publish(event, stream_name: SecureRandom.uuid)
      end
    end
  end
end
