class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
    	t.string :name
    	t.integer :review_image_id
    	t.integer :review_id

      t.timestamps
    end
  end
end
