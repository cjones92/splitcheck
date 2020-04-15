class RemoveAverageFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :splitting_average, :float
  end
end
