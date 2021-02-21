class AddReferenceToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :spell, foreign_key: true
  end
end
