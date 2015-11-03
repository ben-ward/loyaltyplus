class AddAccountIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :account_id, :string
    add_index :users, :account_id, unique: true
  end
end
