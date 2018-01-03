class User < ApplicationRecord
  mount_uploader :picture, PictureUploader
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
  end

  def available_movies
    movies = Hash.new
    self.groups.each do |group|
      movies[group_id] << group.movies
    end


    movies
  end

<<<<<<< HEAD
=======


# =======
#
# >>>>>>> 1680ffead1fee2d1a7cf69ebf7e10b6c68bd7488
>>>>>>> d6c4baa78781d0658c12b052ce342fcaa0a30e2d
end
