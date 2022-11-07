FactoryBot.define do
  factory :order do
    num { "MyString" }
    recipient { "MyString" }
    tel { "MyString" }
    address { "MyString" }
    state { "MyString" }
    note { "MyString" }
    user { nil }
    paid_at { "2022-11-07 13:20:58" }
    transaction_id { "MyString" }
  end
end
