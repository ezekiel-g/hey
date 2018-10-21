class Chatroom < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :owner, class_name: 'User'

  has_many :memberships, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :users, through: :memberships

  def owner_name
    User.find_by_id(self.owner_id).username
  end

  def member_names
    memberships = Membership.where(chatroom_id: self.id)
    names = []

    memberships.each do |membership|
      names << membership.username
    end

    names
  end
end
