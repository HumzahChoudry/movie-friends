class Movie < ApplicationRecord
  has_many :group_movies
  has_many :groups, through: :group_movies
  has_many :comments, through: :group_movies
end
