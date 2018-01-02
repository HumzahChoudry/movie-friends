class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  belongs_to :admin, class_name: "User"

  has_many :group_movies
  has_many :movies, through: :group_movies
end
