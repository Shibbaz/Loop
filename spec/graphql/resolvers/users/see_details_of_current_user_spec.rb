require "rails_helper"

module Resolvers
  module Users
    RSpec.describe ShowDetailsOfCurrentUser, type: :request do
      let(:user) {
        User.create!(
          name: "test",
          email: "test@test.com",
          password: "test"
        )
      }
      let(:context) {
        ctx = {
          current_user: user
        }
      }

      describe ".resolve found" do
        it "see details of current user " do
          result = LoopSchema.execute(query, variables: {}, context: context)
          size = result["data"]["showDetailsOfCurrentUser"].size
          expect(size).to_not eq(0)
          expect(result["data"]["showDetailsOfCurrentUser"]["name"]).to eq(user.name)
        end
      end

      def query
        <<~GQL
          query{
            showDetailsOfCurrentUser{
              name
              email
            }
          }
        GQL
      end
    end
  end
end
