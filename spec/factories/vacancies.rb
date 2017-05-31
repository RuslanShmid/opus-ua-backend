FactoryGirl.define do
  factory :vacancy do
    title { Faker::Job.field }
    category { Faker::Name.last_name }
    city { Faker::Address.city }
    active_to_date { Faker::Date.between(2.days.ago, Date.today) }
    job_type nil
    description { Faker::Lorem.sentences(1) }
    company { Faker::Company.name }
    price_per_hour nil
    website nil
  end
end
