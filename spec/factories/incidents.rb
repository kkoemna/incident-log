FactoryBot.define do
  factory :incident do
    date {'2023.01.01'}
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    place_id { Faker::Number.between(from: 1, to: 24) }
    association :user

    after(:build) do |incident|
      incident.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end