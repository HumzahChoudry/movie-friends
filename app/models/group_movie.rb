class GroupMovie < ApplicationRecord
  belongs_to :group
  belongs_to :movie
  has_many :comments


  def visible_comment_trees
    self.comments.select {|comment| comment.parent_id == nil}.sort_by {|comment| comment.updated_at}.map(&:make_tree)
  end
end
