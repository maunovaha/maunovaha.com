FactoryGirl.define do
  factory :subscriber do
    sequence(:email) do |n|
      "user-#{n}@gmail.com"
    end
    token { SecureRandom.uuid.to_s.gsub('-', '') }
    token_expires_at { Time.now.utc + 24.hours }
  end
end