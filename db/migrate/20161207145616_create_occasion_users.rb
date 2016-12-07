class CreateOccasionUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :occasion_users do |t|
      t.references :user, foreign_key: true
      t.references :occasion, foreign_key: true

      t.timestamps
    end
  end
end
