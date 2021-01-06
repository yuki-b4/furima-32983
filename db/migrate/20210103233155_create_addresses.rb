class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :post, null: false
      t.integer :shipping_from_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building
      t.string :phone, null: false
      t.references :purchase, foreign_key: true
      t.timestamps
    end
  end
end
