class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.references :book, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
