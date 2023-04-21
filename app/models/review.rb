class Review < ApplicationRecord
  belongs_to :product
  validates :reviewer_name, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
