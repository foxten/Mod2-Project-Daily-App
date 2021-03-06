class CreateShoppingTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :shopping_trips do |t|
      t.string :store
      t.float :receipt_total
      t.boolean :online
      t.date :date
      t.integer :user_id

      t.timestamps
    end
  end
end
