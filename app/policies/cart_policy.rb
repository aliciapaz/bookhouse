CartPolicy = Struct.new(:user, :cart) do
  def show?
    user.buyer?
  end

  def add?
    user.buyer?
  end

  def remove?
    user.buyer?
  end
end
