class CreateUserItems < ActiveRecord::Migration[5.0]
  def change
    create_table :user_items do |t|
      t.references :user, foreign_key: true
      t.boolean :claim_more_than_once
      t.string :name

      t.timestamps
    end
  end
end
