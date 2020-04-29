class AddReferencesToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :restaurant, foreign_key: true
    add_reference :comments, :user, foreign_key: true
  end
end
