class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { admin: 0, buyer: 1, seller: 2 }

  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  validate :phone_or_address

  store_accessor :user_info, :phone, :address

  private
    def phone_or_address
      if phone.blank? && address.blank?
        errors.add(:user_info, "is required. You need to select an account type and provide your contact info")
      end
    end
end
