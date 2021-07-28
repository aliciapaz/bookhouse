class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, class_name: "Book", foreign_key: "seller_id", dependent: :destroy, inverse_of: :seller
  has_many :purchases, class_name: "Purchase", foreign_key: :buyer_id, dependent: :destroy, inverse_of: :buyer
  has_many :purchased_books, through: :purchases, source: :book

  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  validates :role, presence: true
  validate :phone_or_address

  after_create :update_initial_balance

  jsonb_accessor :user_info, phone: :string, address: :string, balance: :decimal

  enum role: { admin: 0, buyer: 1, seller: 2 }

  def cart_count
    $redis.scard "cart#{id}"
  end

  def cart_total_price
    total_price = 0
    find_cart_books.each { |book| total_price += book.price }
    total_price
  end

  def find_cart_books
    cart_ids = $redis.smembers "cart#{id}"
    Book.find(cart_ids)
  end

  def purchase_cart_books!
    find_cart_books.each { |book| purchase(book, self) }
    $redis.del "cart#{id}"
  end

  private
    def phone_or_address
      return unless phone.blank? && address.blank? && role != "admin"

      errors.add(:user_info, "is required. You need to select an account type and provide your contact info")
    end

    def update_initial_balance
      self.balance = 50 if buyer?
      self.balance = 0 if seller?
      self.balance = 0 if admin?
      save!
    end

    def purchase(book, user)
      Purchase.create!(book_id: book.id, buyer_id: user.id)
      book.sold!
      seller = User.find(book.seller_id)
      update_balances(book, user, seller)
    end

    def update_balances(book, buyer, seller)
      seller.balance += (book.price - 1)
      logger.info seller.balance.class
      buyer.balance -= book.price
      admin = User.first
      admin.balance += 1
      admin.save!
      buyer.save!
      seller.save!
    end
end
