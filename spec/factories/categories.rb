FactoryBot.define do
  factory :category do
    name { Faker::Commerce.unique.department }
    self.alias { name.parameterize }

    trait :with_items do
      after(:build) do |category|
        category.items = build_list(:item, 5) if category.items.blank?
      end
    end
  end
end
