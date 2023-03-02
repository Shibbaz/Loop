require "faker"
FactoryBot.define do
  factory :session do
    start_at { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    end_at { Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 2) }
    notes { ["Dirt"] }
    id { SecureRandom.uuid }
  end
end