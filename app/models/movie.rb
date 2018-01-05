class Movie < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :group_movies
  has_many :groups, through: :group_movies
  has_many :comments, through: :group_movies
  has_many :users, through: :groups

  def visible_comment_trees(user_id)
    self.comments.select {|comment| comment.parent_id == nil && comment.visible_by_user?(user_id) && comment.content != nil}.sort_by {|comment| comment.updated_at}.map(&:make_tree)
  end

  def user_groups(id)
    self.groups.select {|group| group.user_ids.include?(id)}
  end
end
