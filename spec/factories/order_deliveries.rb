FactoryBot.define do
  factory :order_delivery do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id { 2 }
    item_id { 2 }
    association :user
    association :item
  end
end
