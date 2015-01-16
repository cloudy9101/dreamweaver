class Day < ActiveRecord::Base
  include Timeago
  
  belongs_to :target
  belongs_to :user
  validates :date_at, :comment, :target_id, :user_id, presence: true
  validates :date_at, uniqueness: { scope: :target_id, message: "今日已经打卡，请勿重复提交。" }

  def self.from_following_targets_by(user)
  	following_target_ids = user.abstract_target_ids
    targets = Target.where("abstract_target_id IN (?)", following_target_ids)
    target_ids = []
    targets.each do |target|
      target_ids << target.id
    end
  	where("target_id IN (?)", target_ids)
  end

  def self.from_followings_by(user)
  	following_ids = user.following_ids
  	where("user_id IN (?)", following_ids)
  end
end
