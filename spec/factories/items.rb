FactoryBot.define do
  factory :item do
    item_name               { Faker::Commerce.product_name }
    # item_name               { 'テスト商品' }
    comment                 { Faker::Lorem.sentence }
    # comment                 { 'テストコメント' }
    category_id             { 2 }
    condition_id            { 2 }
    shipping_cost_id        { 2 }
    prefecture_id           { 2 }
    shipping_duration_id    { 2 }
    price                   { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
