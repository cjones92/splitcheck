class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.integer :votes_for_splitting
      t.integer :votes_against_splitting
      t.float :splitting_average

      t.timestamps
      
      change_column(:restaurants, :votes_for_splitting, 0)
      change_column(:restaurants, :votes_against_splitting, 0)
    end
  end
end
