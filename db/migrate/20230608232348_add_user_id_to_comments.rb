class AddUserIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :user_id, :bigint
    add_foreign_key :comments, :users, column: :user_id
    add_index :comments, :user_id
  end
end
