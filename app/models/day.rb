class Day < ActiveRecord::Base
  belongs_to :target
  belongs_to :user
  validates :date_at, :comment, :target_id, :user_id, presence: true
  validates :date_at, uniqueness: { scope: :target_id, message: "今日已经打卡，请勿重复提交。" }
end
