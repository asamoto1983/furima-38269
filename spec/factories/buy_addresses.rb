FactoryBot.define do
  factory :buy_address do
    post_code            { Faker::Number.number(digits: 7).to_s.insert(3, '-') }
    prefecture_id        { Faker::Number.between(from: 2, to: 48) }
    municipalities       { Faker::Lorem.sentence }
    house_number         { Faker::Lorem.sentence }
    build_name           { Faker::Lorem.sentence }
    phone_number         { Faker::Number.number(digits: 10) }
    token                { Faker::Number.number(digits: 32) }
  end
end
