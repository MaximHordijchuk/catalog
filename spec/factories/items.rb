FactoryBot.define do
  factory :item do
    name { Faker::Commerce.unique.product_name }
    price { Faker::Commerce.price(0..9_999.0) }
    description { Faker::Lorem.sentence }

    after(:build) do |item|
      item.category ||= build(:category)
    end
  end
end
