class Membership < ApplicationRecord
  belongs_to :group
  belongs_to :user
  validates :group_id, :user_id, presence: true

  validate :membership_already_exists?

  def membership_already_exists?
    if !Membership.where(user_id: self.user_id, group_id: self.group_id).empty?
      errors.add(:group_id, "is already accessible by user")
    end
  end
end
