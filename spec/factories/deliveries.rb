FactoryBot.define do
  factory :delivery do
    association :order
  end
end
