class Review < ApplicationRecord
  attachment :review_image

  belongs_to :place
  belongs_to :user
end
