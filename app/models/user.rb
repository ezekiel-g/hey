class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :messages
  has_many :chatrooms, through: :messages

  mount_uploader :profile_photo, ProfilePhotoUploader

  def admin?
    role == 'admin'
  end
end
