class Spell < ApplicationRecord
  has_many :reviews, dependent: :destroy
  SCHOOLS = ['Abjuration', 'Conjuration', 'Divination', 'Enchantment', 'Evocation', 'Illusion', 'Necromancy', 'Transmutation']

  DAMAGETYPES = ['Poison', 'Acid', 'Fire', 'Cold', 'Radiant', 'Necrotic', 'Lightning', 'Thunder', 'Force', 'Psychic']

  def average_rating
  return 0 if reviews.empty?
  (reviews.pluck(:rating).sum / reviews.count)
  end
end
