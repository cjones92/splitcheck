class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.integer :votes_for_splitting
      t.integer :votes_against_splitting
      t.string :splitting_average
      t.string :float

      t.timestamps
    end
  end
end
