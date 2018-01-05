class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :group_movie
  has_many :children, class_name: "Comment", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Comment", optional: true
  has_one :movie, through: :group_movie
  has_one :group, through: :group_movie

  validates :group_movie_id, :user_id, presence: true
  validate :content_is_more_than_two_characters_or_is_nil

  def get_rating
    self.children.reduce(0) do |sum, comment|
      sum += comment.vote
    end
  end


  def time_since_created
    if self.created_at.to_date == Time.now.to_date
      hours_since = (((Time.now - self.created_at)/60)/60).floor.to_s
      if hours_since == "1"
        time_string = "Submitted " + hours_since + " hour ago"
      else
        time_string = "Submitted " + hours_since + " hours ago"
      end
    else
      days_since = ((((Time.now - self.created_at)/60)/60)/24).floor.to_s
      if days_since == "1"
        time_string = "Submitted " + days_since + " day ago"
      else
        time_string = "Submitted " + days_since + " days ago"
      end
    end
  end

  def make_tree
    result = {comment: self}
    if self.children.empty?
      result[:children] = nil
    else
      result[:children] = self.children.select {|comment| comment.content != nil }.map do |comment|
        comment.make_tree
      end
    end
    result
  end

  def visible_by_user?(user_id)
    self.group.user_ids.include?(user_id)
  end

  def children_that_are_not_votes
    self.children.select {|comment| comment.content != nil}
  end

  def content_is_more_than_two_characters_or_is_nil
    if self.content != nil && self.content.length < 2
      errors.add(:content, "must be greater than 2 characters")
    end
  end
end
