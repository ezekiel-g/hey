class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom

  def username
    User.find_by_id(self.user_id).username
  end
end
