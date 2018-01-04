class Group < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  belongs_to :admin, class_name: "User"

  has_many :group_movies
  has_many :movies, through: :group_movies
  has_many :comments, through: :group_movies

  def visible_comment_trees
    self.comments.select {|comment| comment.parent_id == nil}.sort_by {|comment| comment.updated_at}.map(&:make_tree)
  end
end
