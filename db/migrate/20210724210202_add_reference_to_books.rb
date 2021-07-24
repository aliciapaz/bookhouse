class AddReferenceToBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :seller, null: false, foreign_key: { to_table: :users } # rubocop:disable Rails/NotNullColumn
  end
end
