class CreateClaims < ActiveRecord::Migration[5.0]
  def change
    create_table :claims do |t|
      t.references :claimer_user, references: :user
      t.references :user_item, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
