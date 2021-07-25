require "faker"

Rails.logger.info "Seeding database"

User.destroy_all
3.times do
  User.create!(name: Faker::Name.unique.name, email: Faker::Internet.email, password: Faker::Internet.password,
               role: "seller", phone: Faker::PhoneNumber.phone_number)
end

Rails.logger.info "3 sellers created"

Book.destroy_all
18.times do
  Book.create!(title: Faker::Book.title,
               description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
               author: Faker::Book.author,
               price: "9.99",
               seller_id: rand(1..3))
end

Rails.logger.info "18 books created"
