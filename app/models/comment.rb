class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :group_movie
  has_many :children, class_name: "Comment", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Comment", optional: true
  has_one :movie, through: :group_movie
  has_one :group, through: :group_movie


  def get_rating
    # Comment.all.select do |c|
    #   c.parent_id = self.id
    # end
    self.children.reduce(0) do |sum, comment|
      sum += comment.vote
    end
  end

  def make_tree
    result = {parent: self}
    if self.children.empty?
      result[:children] = nil
    else
      result[:children] = self.children.map do |comment|
        comment.make_tree
      end
    end
    result
  end

end
