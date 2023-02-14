FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.sentence }
    association :user
    association :incident
  end
end