class Spell < ApplicationRecord
  has_many :reviews, dependent: :destroy
  SCHOOLS = ['Abjuration', 'Conjuration', 'Divination', 'Enchantment', 'Evocation', 'Illusion', 'Necromancy', 'Transmutation']

  DAMAGETYPES = ['Poison', 'Acid', 'Fire', 'Cold', 'Radiant', 'Necrotic', 'Lightning', 'Thunder', 'Force', 'Psychic']

  include PgSearch::Model
  pg_search_scope :search_by_title_and_synopsis,
    against: [ :title, :synopsis ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }
end

  def average_rating
    return 0 if reviews.empty?
    (reviews.pluck(:rating).sum / reviews.count)
  end
end
