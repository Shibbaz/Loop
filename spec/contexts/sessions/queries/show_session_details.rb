require "rails_helper"

module Contexts
  module Users
    module Queries
      RSpec.describe ShowSessionDetails, type: :request do
        describe "Testing Query ShowSessionDetail in Sessions Context" do
          it "exists" do
            session = create(:session)
            expect { Contexts::Sessions::Queries::ShowSessionDetails.new.call(id: Session.first.id) }.to raise_error(ActiveRecord::RecordNotFound)
          end

          it "does not eist" do
            expect { Contexts::Sessions::Queries::ShowSessionDetails.new.call(id: SecureRandom.uuid) }.to raise_error(ActiveRecord::RecordNotFound)
          end
        end
      end
    end
  end
end
