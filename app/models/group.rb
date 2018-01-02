class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  has_many :group_movies
  has_many :movies, through: :group_movies
end
