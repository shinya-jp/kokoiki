class AddReviewToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :review_id, :integer
  end
end
