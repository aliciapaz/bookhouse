require "rails_helper"

RSpec.describe User, type: :model do
  it "is valid with a name (buyer)" do
    user = build(:buyer, name: "Joe")
    expect(user).to be_valid
  end

  it "is valid with a name (seller)" do
    user = build(:seller, name: "Joe")
    expect(user).to be_valid
  end

  it "is not valid with a short name" do
    user = build(:seller, name: "J")
    expect(user).not_to be_valid
  end

  it "is not valid with a long name" do
    user = build(:seller, name: "This is a very very very long name")
    expect(user).not_to be_valid
  end

  it "is not valid without a phone (seller)" do
    user = build(:seller, phone: "")
    expect(user).not_to be_valid
  end

  it "is not valid without an address (buyer)" do
    user = build(:buyer, address: "")
    expect(user).not_to be_valid
  end

  it "is not valid without a role" do
    user = build(:user, role: "")
    expect(user).not_to be_valid
  end

  it "is valid without a phone or address if admin" do
    user = build(:user, role: "admin")
    expect(user).to be_valid
  end

  it "gives $50 to a buyer after a successful sign-up" do
    buyer = create(:buyer)
    expect(buyer.balance).to eq(50)
  end

  it "gives a balance of $0 to a seller after a successful sign-up" do
    buyer = create(:seller)
    expect(buyer.balance).to eq(0)
  end

  it "gives a balance of $0 to an admin user after sign-up" do
    admin = create(:user, role: "admin")
    expect(admin.balance).to eq(0)
  end
end
