class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books, class_name: "Book", foreign_key: "seller_id", dependent: :destroy, inverse_of: :seller

  enum role: { admin: 0, buyer: 1, seller: 2 }

  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  validates :role, presence: true
  validate :phone_or_address

  store_accessor :user_info, :phone, :address, :balance

  after_create :update_initial_balance

  private
    def phone_or_address
      return unless phone.blank? && address.blank? || role == "admin"

      errors.add(:user_info, "is required. You need to select an account type and provide your contact info")
    end

    def update_initial_balance
      user_info["balance"] = 50 if buyer?
      user_info["balance"] = 0 if seller?
      save!
    end
end
