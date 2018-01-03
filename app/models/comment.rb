class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :group_movie
  has_many :children, class_name: "Comment", foreign_key: "parent_id"
  belongs_to :parent, class_name: "Comment", optional: true
  has_one :movie, through: :group_movie
  has_one :group, through: :group_movie
end
