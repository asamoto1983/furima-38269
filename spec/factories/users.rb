FactoryBot.define do
  factory :user do    
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"1q2w3e"}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"山田"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"ヤマダ"}
    birth_day             {"2000-01-01"}
  end
end