class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :group_movie
  has_many :children, class_name: "Comment", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Comment", optional: true
  has_one :movie, through: :group_movie
  has_one :group, through: :group_movie


  def get_rating
    self.children.reduce(0) do |sum, comment|
      sum += comment.vote
    end
  end

  def make_tree
    result = {comment: self}
    if self.children.empty?
      result[:children] = nil
    else
      result[:children] = self.children.map do |comment|
        comment.make_tree
      end
    end
    result
  end

  def visible_by_user?(user_id)
    self.group.user_ids.include?(user_id)
  end

end
