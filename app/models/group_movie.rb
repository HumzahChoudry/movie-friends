class GroupMovie < ApplicationRecord
  belongs_to :group
  belongs_to :movie
  has_many :comments
end
