require "rails_helper"
require "faker"

RSpec.describe User, type: :model do
  context "when passes sucessful" do
    it "parrams ok" do
      user = create(:user, name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Internet.password, id: SecureRandom.uuid)
      expect(user).to be_valid
    end
  end

  context "when does return failure" do
    it "email is not ok" do
      expect {
        create(:user,
               name: Faker::Name.name,
               email: Faker::Internet.name,
               password_digest: Faker::Internet.password,
               id: SecureRandom.uuid)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
