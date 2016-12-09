class AddForeignKeyToClaims < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :claims, :users, column: :claimer_user_id
  end
end
