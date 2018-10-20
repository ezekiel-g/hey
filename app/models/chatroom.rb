class Chatroom < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  belongs_to :owner, class_name: 'User'
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
end
