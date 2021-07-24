FactoryBot.define do
  factory :book do
    title { "MyString" }
    description { "MyText" }
    author { "MyString" }
    price { "9.99" }
    seller { nil }
  end
end
