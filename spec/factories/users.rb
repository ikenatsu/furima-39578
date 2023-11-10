FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 9)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_kana        {'ヤマダ'}
    first_name_kana       {'タロウ'}
    birth_day             {1955-11-4}
  end
end