class User < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :targets, dependent: :destroy
	has_many :days, dependent: :destroy
	validates :name, presence: true
	validates :name, uniqueness: true
end
