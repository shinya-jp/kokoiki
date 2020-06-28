class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.integer :genre
      t.integer :prefecture


      t.timestamps
    end
  end
end
