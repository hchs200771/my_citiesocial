FactoryBot.define do
  factory :sku do
    spec { Faker::Lorem.paragraph }
    quantity { Faker::Number.between(from: 10, to: 100) }

    product
  end
end
