class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :price
      t.string :address
      t.integer :area
      t.integer :rooms
      t.integer :toilets
      t.string :photo

      t.timestamps
    end
  end
end
