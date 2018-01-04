class GroupMovie < ApplicationRecord
  belongs_to :group
  belongs_to :movie
  has_many :comments

  validate :group_movie_already_exists?

  def group_movie_already_exists?
    if GroupMovie.where(movie_id: self.movie_id, group_id: self.group_id)
      errors.add(:group_id, "is already discussing this movie.")
    end
  end


end
