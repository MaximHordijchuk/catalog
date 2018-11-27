Category.destroy_all

30.times do
  category_name = Faker::Commerce.unique.department
  category = Category.create!(name: category_name, alias: category_name.parameterize)
  20.times do
    category.items.create!(
      name: Faker::Commerce.unique.product_name,
      price: Faker::Commerce.price(0..9_999.0),
      description: Faker::Lorem.sentence
    )
  end
end
