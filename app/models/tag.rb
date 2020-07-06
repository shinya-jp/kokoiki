class Tag < ApplicationRecord
	belongs_to :review
	belongs_to :review_image
end
