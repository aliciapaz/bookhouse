require "rails_helper"

RSpec.describe Book, type: :model do
  it "is not valid without a title" do
    seller = create(:seller)
    book = build(:book, seller_id: seller.id, title: "")
    expect(book).not_to be_valid
  end

  it "is not valid without an author" do
    seller = create(:seller)
    book = build(:book, seller_id: seller.id, author: "")
    expect(book).not_to be_valid
  end

  it "is not valid without a description" do
    seller = create(:seller)
    book = build(:book, seller_id: seller.id, description: "")
    expect(book).not_to be_valid
  end

  it "is not valid without a price" do
    seller = create(:seller)
    book = build(:book, seller_id: seller.id, price: "")
    expect(book).not_to be_valid
  end

  it "is not valid without a seller_id" do
    book = build(:book, seller_id: nil)
    expect(book).not_to be_valid
  end
end
