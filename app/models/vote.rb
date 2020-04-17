class Vote < ApplicationRecord
belongs_to :restaurant
belongs_to :user
validates_presence_of :restaurant_id, :user_id
validates_inclusion_of :for_splitting, in: [true, false]

    #Returns number of for-splitting votes in a collection of vote objects
   def self.get_votes_for_splitting
    self.where(for_splitting: true).size
   end
   
   #Returns number of against-splitting votes in a collection of vote objects
   def self.get_votes_against_splitting
    self.where(for_splitting: false).size
   end

end
