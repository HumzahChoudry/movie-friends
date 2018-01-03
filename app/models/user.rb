class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :memberships
  has_many :groups, through: :memberships
  has_many :comments
  has_many :admin_groups, class_name: "Group", foreign_key: "admin_id"

  def get_user_groups_comments
    result = []

    self.groups.each do |group|
      result << group.comments
    end

    result.flatten!
    result.sort_by {|r| r.updated_at}

    # Alternate comment selection
    # Comment.all.select do |comment|
    #   comment.group.user_ids.incude?(self.id)
    # end
  end

  def available_movies
    movies = Hash.new
    self.groups.each do |group|
      movies[group_id] << group.movies
    end


    movies
  end

end
