FactoryBot.define do
  factory :order_item do
    order { nil }
    sku { nil }
    quantity { 1 }
  end
end
