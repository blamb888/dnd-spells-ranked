class Review < ApplicationRecord
  belongs_to :spell

  validates :rating, :content, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: (0..5).to_a }
  validates :content, length: { minimum: 10 }
end
