class Review < ApplicationRecord
  attachment :review_image

  belongs_to :place
  belongs_to :user
  has_many :review_images, dependent: :destroy
  accepts_attachments_for :review_images, attachment: :image
end
