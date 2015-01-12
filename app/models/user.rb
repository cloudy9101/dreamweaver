class User < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :targets, dependent: :destroy
	has_many :days, dependent: :destroy

	
	has_many :relationships, foreign_key: 'follower_id'
	has_many :reverse_relationships, foreign_key: 'following_id', class_name: "Relationship"

	has_many :followings, through: :relationships
	has_many :followers, through: :reverse_relationships

	validates :name, presence: true
	validates :name, uniqueness: true


	def following?(user)
		relationships.find_by(following_id: user.id)
	end
end
