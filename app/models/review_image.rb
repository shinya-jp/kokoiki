class ReviewImage < ApplicationRecord
  belongs_to :review
  has_many :tags, dependent: :destroy

  attachment :image
end
