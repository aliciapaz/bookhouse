FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    description { Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false) }
    author { Faker::Book.author }
    price { "9.99" }
    seller_id { nil }
  end
end
