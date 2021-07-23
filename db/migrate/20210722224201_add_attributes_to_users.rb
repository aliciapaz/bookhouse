class AddAttributesToUsers < ActiveRecord::Migration[6.1]
  def change
    change_table :users, bulk: true do |t|
      t.column :name, :string, null: false
      t.column :role, :integer, null: false
      t.column :user_info, :jsonb, null: false, default: {}
    end
  end
end
