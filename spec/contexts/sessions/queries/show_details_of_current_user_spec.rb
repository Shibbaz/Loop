require "rails_helper"

module Contexts
  module Users
    module Queries
      RSpec.describe ShowDetailsOfCurrentUser, type: :request do
        describe "Testing Query ShowDetailsOfCurrentUser in Users Context" do
          it "has none routes" do
            expect { Contexts::Users::Queries::ShowDetailsOfCurrentUser.new.call(id: SecureRandom.uuid) }.to raise_error(ActiveRecord::RecordNotFound)
          end
        end
      end
    end
  end
end
