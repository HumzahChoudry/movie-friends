class Group < ApplicationRecord
  mount_uploader :picture, PictureUploader
  has_many :memberships
  has_many :users, through: :memberships
  belongs_to :admin, class_name: "User"

  has_many :group_movies
  has_many :movies, through: :group_movies
  has_many :comments, through: :group_movies

  def visible_comment_tree
    self.comments.select {|comment| comment.parent_id == nil}
  end
end
