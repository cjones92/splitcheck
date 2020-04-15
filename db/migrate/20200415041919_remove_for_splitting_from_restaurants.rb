class RemoveForSplittingFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :for_splitting, :integer
    remove_column :restaurants, :against_splitting, :integer
  end
end
