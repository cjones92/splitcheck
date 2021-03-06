class Restaurant < ApplicationRecord
has_many :votes
has_many :favorites
has_many :comments
has_many :users, through: :votes
has_many :users, through: :favorites
has_many :users, through: :comments

validates_presence_of :name, :location

validates_uniqueness_of :name, scope: :location, :message => 'and location of this restaurant already exists.'


 #Searches the name and location columns for information similar to entered search
 def self.search(name_or_location)
   self.where("name LIKE ? OR location LIKE ?", "%#{name_or_location}%", "%#{name_or_location}%")
 end


end
