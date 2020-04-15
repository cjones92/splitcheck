class Vote < ApplicationRecord
belongs_to :restaurant
belongs_to :user

def self.get_splitting_votes_for_restaurant(restaurant_id)

@votes = self.where("restaurant_id LIKE ? AND for_splitting LIKE ?", "%#{restaurant_id}%", "%#{true}%")
@votes.size
end

def self.get_against_splitting_votes_for_restaurant(restaurant_id)

@votes = self.where("restaurant_id LIKE ? AND for_splitting LIKE ?", "%#{restaurant_id}%", "%#{false}%")
if @votes.size == 0
@votes = 0
end 
@votes
end

def self.get_average_votes_for_restaurant(restaurant_id)

@yes = self.where(for_splitting: true).size
@no = self.where(for_splitting: false).size
if (@yes + @no) > 0
@average = (@yes / (@yes + @no)) * 100
else
@average = 0
end
@average
end
end
