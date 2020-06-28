class RemoveReviewImageIdFromReview < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :review_image_id, :string
  end
end
