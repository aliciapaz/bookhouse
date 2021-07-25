class BookPolicy
  attr_reader :user, :book

  def initialize(user, book)
    @user = user
    @book = book
  end

  # CRUD actions
  def new?
    user.seller?
  end

  def create?
    user.seller?
  end

  def edit?
    user.seller?
  end

  def update?
    user.seller?
  end

  def destroy?
    user.seller? || user.admin?
  end
end
