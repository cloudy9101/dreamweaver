class Relationship < ActiveRecord::Base
	
	belongs_to :following, class_name: "User"
	belongs_to :follower, class_name: "User"

	def self.from_followings_by(user)
		following_ids = user.following_ids
		where("follower_id IN (?)", following_ids)
	end
end
