class Book < ApplicationRecord
  belongs_to :seller, class_name: "User", inverse_of: :books
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 100 }
  validates :author, presence: true, length: { minimum: 2, maximum: 50 }
  validates :description, presence: true, length: { maximum: 2000 }
  validates :price, presence: true, numericality: true
end
