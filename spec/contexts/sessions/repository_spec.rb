require "rails_helper"
require "faker"

RSpec.describe Contexts::Sessions::Repository, type: :model do
  context "create method" do
    it "it success" do

      event_store = Contexts::Sessions::Repository.new.create_session(start_at:DateTime.now, end_at: DateTime.current.beginning_of_day, notes: "holds are not cleaned")
      expect(event_store).to have_published(an_event(SessionWasCreated))
    end
  end
end
