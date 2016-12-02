class CreateOccasions < ActiveRecord::Migration[5.0]
  def change
    create_table :occasions do |t|
      t.references :creator_user, references: :user
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
