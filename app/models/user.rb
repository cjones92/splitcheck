class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :votes
  has_many :favorites
  has_many :comments
  has_many :restaurants, through: :votes
  has_many :restaurants, through: :favorites
  has_many :restaurants, through: :comments
end
