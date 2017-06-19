FactoryGirl.define do
  factory :vacancy do
    title { Faker::Job.field }
    category { Faker::Name.last_name }
    city { Faker::Address.city }
    email { Faker::Internet.email }
    active_to_date { Faker::Date.between(2.days.ago, Date.today) }
    job_type { Faker::Job.title }
    description { Faker::Lorem.sentence(3, true, 4) }
    company { Faker::Company.name }
    price_per_hour { Faker::Number.between(5, 30) }
    website nil
  end
end
