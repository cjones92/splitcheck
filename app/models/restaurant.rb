class Restaurant < ApplicationRecord

validates_presence_of :name, :location

validates_uniqueness_of :name, scope: :location, :message => 'This restaurant already exists.'
end
