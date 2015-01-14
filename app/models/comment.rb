class Comment < ActiveRecord::Base
	include Timeago

	belongs_to :user
	belongs_to :target

	has_many :replys, class_name: "Comment", foreign_key: "root_id"
	belongs_to :root, class_name: "Comment"

	validates :content, :user_id, :target_id, presence: true

	scope :root, -> { where('root_id = ?', 0) }

end
