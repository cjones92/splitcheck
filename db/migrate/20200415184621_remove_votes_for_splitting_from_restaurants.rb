class RemoveVotesForSplittingFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :votes_for_splitting, :integer
    remove_column :restaurants, :votes_against_splitting, :integer
  end
end
