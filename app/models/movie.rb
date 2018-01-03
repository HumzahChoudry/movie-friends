class Movie < ApplicationRecord
  has_many :group_movies
  has_many :groups, through: :group_movies
  has_many :comments, through: :group_movies

  def visible_comment_tree
    self.comments.select {|comment| comment.parent_id == nil}
  end
end
