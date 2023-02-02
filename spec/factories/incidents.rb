FactoryBot.define do
  factory :incident do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    date { Faker::Number.between(from: 20000101, to: 20991231) }
    place_id { Faker::Number.between(from: 1, to: 24) }
    association :user

    after(:build) do |incident|
      incident.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
