class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :name
      t.integer :price
      t.string :address
      t.string :country
      t.integer :occupancy
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
