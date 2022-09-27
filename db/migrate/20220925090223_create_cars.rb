class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :hash_id
      t.string :make
      t.string :model
      t.text :colors
      t.integer :price
      t.integer  :currency, default: 0
      t.integer :unit, default: 0
      t.integer :distance
      t.string :photo
      t.timestamps
    end
  end
end
