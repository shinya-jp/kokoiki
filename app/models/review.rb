class Review < ApplicationRecord
  belongs_to :place
  belongs_to :user

  has_many :review_images, dependent: :destroy
  accepts_nested_attributes_for :review_images
  accepts_attachments_for :review_images, attachment: :image
  has_many :review_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :title, presence: true,
                    length: { maximum: 30 }
  validates :body,  presence: true
  validates :rate,  numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0.5,
  }, presence: true

end
