class Book < ApplicationRecord
  belongs_to :seller, class_name: "User", inverse_of: :books
  has_one :purchase, dependent: :destroy
  has_one :buyer, through: :purchases, source: :buyer
  has_one_attached :image

  enum status: { available: 0, taken: 1, sold: 2 }

  scope :available, -> { where(status: "available") }
  scope :sold, -> { where(status: "sold") }

  validates :title, presence: true, length: { maximum: 100 }
  validates :author, presence: true, length: { minimum: 2, maximum: 50 }
  validates :description, presence: true, length: { maximum: 2000 }
  validates :price, presence: true, numericality: true

  def self.search_by_title(search)
    return unless search

    where("UPPER(title) LIKE ?", "%#{search.upcase}%")
  end

  def cart_action(current_user_id)
    if $redis.sismember "cart#{current_user_id}", id
      "Remove from"
    else
      "Add to"
    end
  end
end
