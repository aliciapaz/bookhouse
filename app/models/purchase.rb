class Purchase < ApplicationRecord
  belongs_to :book
  belongs_to :buyer, class_name: "User"
end
