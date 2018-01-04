class Movie < ApplicationRecord
  has_many :group_movies
  has_many :groups, through: :group_movies
  has_many :comments, through: :group_movies

  def visible_comment_trees(user_id)
    self.comments.select {|comment| comment.parent_id == nil && comment.visible_by_user?(user_id)}.sort_by {|comment| comment.updated_at}.map(&:make_tree)
  end
end
