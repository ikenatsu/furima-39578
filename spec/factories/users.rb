FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 9) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'タロウ' }
    birth_day             { '1985-11-4'.to_date }
  end
end
