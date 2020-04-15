class AddRestaurantToVote < ActiveRecord::Migration[5.2]
  def change
    add_reference :votes, :restaurant, foreign_key: true
    add_reference :votes, :user, foreign_key: true
  end
end
