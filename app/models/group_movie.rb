class GroupMovie < ApplicationRecord
  belongs_to :group
  belongs_to :movie
  has_many :comments

  validate :group_movie_already_exists?

  def group_movie_already_exists?
    if !GroupMovie.where(movie_id: self.movie_id, group_id: self.group_id).empty?
      errors.add(:group_id, "is already discussing this movie.")
    end
  end


  def visible_comment_trees
    self.comments.select {|comment| comment.parent_id == nil && comment.content != nil}.sort_by {|comment| comment.updated_at}.reverse.map(&:make_tree)
  end
end
