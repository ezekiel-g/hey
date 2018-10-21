class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  validates :user_id, uniqueness: { message: "is already a member" }

  def username
    User.find_by_id(self.user_id).username
  end
end
