# To generate this factory:
# rails g factory_bot:model user

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence(:email) { |n| Faker::Internet.email.sub("@", "#{n}@") }
    password { "supersecret" }
  end
end
