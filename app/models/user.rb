class User < ApplicationRecord
  mount_uploader :picture, PictureUploader
  validates :name, presence: true, uniqueness: true
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :comments
  has_many :admin_groups, class_name: "Group", foreign_key: "admin_id"

  validates :name, uniqueness: true

  def get_user_groups_comments
    result = []

    self.groups.each do |group|
      result << group.comments
    end

    result.flatten!
    result.sort_by {|r| r.updated_at}
  end

  def available_movies
    movies = Hash.new
    self.groups.each do |group|
      movies[group_id] << group.movies
    end
    movies
  end

  def get_all_comment_trees_visible_by_user
    self.groups.map(&:visible_comment_trees).flatten.sort_by {|comment_tree| comment_tree[:comment][:updated_at]}
  end

end
