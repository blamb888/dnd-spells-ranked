class Spell < ApplicationRecord
  has_many :reviews, dependent: :destroy

  def average_rating
  return 0 if reviews.empty?
  (reviews.pluck(:rating).sum / reviews.count)
  end
end
