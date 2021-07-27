PurchasePolicy = Struct.new(:user, :cart) do
  def checkout?
    user.buyer?
  end

  def confirm_purchase?
    user.buyer?
  end
end
