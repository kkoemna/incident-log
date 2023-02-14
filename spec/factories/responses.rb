FactoryBot.define do
  factory :response do
    date {'2023.01.01'}
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.sentence }
    cost { '300円' }
    association :user
    association :incident

    after(:build) do |response|
      response.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end