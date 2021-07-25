class Book < ApplicationRecord
  belongs_to :seller, class_name: "User", inverse_of: :books
  has_one_attached :image
end
