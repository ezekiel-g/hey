class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates_uniqueness_of :user_id, { scope: :chatroom_id, message: 'is already a member' }

  def username
    User.find_by_id(self.user_id).username
  end
end
