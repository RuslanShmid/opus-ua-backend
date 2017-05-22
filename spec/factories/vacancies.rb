FactoryGirl.define do
  factory :vacancy do
    title { Faker::Job.field }
    category { FFaker::Name.last_name }
    city { Faker::Address.city }
    street { Faker::Address.street_address }
    active_to_date { Faker::Date.between(2.days.ago, Date.today) }
    type nil
    description { Faker::Lorem.sentences(1) }
    company { Faker::Company.name }
    price_per_hour nil
    website nil
  end
end
