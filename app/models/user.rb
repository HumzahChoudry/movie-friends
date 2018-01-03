class User < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :memberships
  has_many :groups, through: :memberships
  has_many :comments
  has_many :admin_groups, class_name: "Group", foreign_key: "admin_id"
  
end
