FactoryBot.define do
  factory :user, class: "User" do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    role { "admin" }
  end

  factory :seller, class: "User" do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    role { "seller" }
    phone { Faker::PhoneNumber.phone_number }
  end

  factory :buyer, class: "User" do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    role { "buyer" }
    address { Faker::Address.full_address }
  end
end
