class CreateOccasionUserItems < ActiveRecord::Migration[5.0]
  def change
    create_table :occasion_user_items do |t|
      t.references :occasion, foreign_key: true
      t.references :user_item, foreign_key: true

      t.timestamps
    end
  end
end
