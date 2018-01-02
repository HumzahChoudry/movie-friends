class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :group_movie
  has_many :children, class_name: "Comment", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Comment"
  has_one :movie, through: :group_movie

end
