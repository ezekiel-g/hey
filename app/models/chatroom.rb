class Chatroom < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :owner, class_name: 'User'

  has_many :memberships, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users, through: :memberships

  def owner_name
    User.find_by_id(self.owner_id).username
  end
end
