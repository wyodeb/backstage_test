class AddSlugToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :slug, :string
    add_index :cars, :slug, unique: true
  end
end
