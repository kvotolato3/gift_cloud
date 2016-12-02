class AddForeignKeyToOccasions < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :occasions, :users, column: :creator_user_id
  end
end
