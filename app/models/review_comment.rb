class ReviewComment < ApplicationRecord
  belongs_to :review
  belongs_to :user

  validates :comment, presence: true,
                      length: { maximum: 128 }
end
