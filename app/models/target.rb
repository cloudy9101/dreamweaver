class Target < ActiveRecord::Base
  include Timeago
  
  belongs_to :user
  belongs_to :abstract_target
  has_many :days, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_and_belongs_to_many :like_users, class_name: "User", foreign_key: 'target_id', association_foreign_key: "user_id", join_table: 'likeable_targets_like_users'

  validates :start_time, :finish_time, presence: true
  validate :time_cannot_be_in_the_past, :finish_time_cannot_earlier_than_start_time

  self.per_page = 8

  scope :great, -> { where('great = ?', 1) }

  def name
    abstract_target.name
  end

  def detail
    abstract_target.detail
  end

  def category
    abstract_target.category
  end

  def followed_users
    abstract_target.users
  end

  def followed_targets
    abstract_target.targets
  end

  def plan_days_count
    (finish_time - start_time).to_i
  end

  def percent
    ((days.count.to_f / plan_days_count) * 100).to_i
  end

  def followed?(user)
    abstract_target.users.include?(user)
  end

  def liked?(user)
    like_users.include?(user)
  end

  def record_today?
    days.find_by_date_at(Date.today) ? true : false
  end

  def self.from_followings_by(user)
    following_ids = user.following_ids
    where("user_id IN (?)", following_ids)
  end

  def time_cannot_be_in_the_past
  	if start_time.present? && start_time < Date.today
  		errors.add(:start_time, "开始时间不能早于今日日期")
  	end
  	if finish_time.present? && finish_time < Date.today
  		errors.add(:finish_time, "结束时间不能早于今日日期")
  	end
  end

  def finish_time_cannot_earlier_than_start_time
  	if start_time.present? && finish_time.present? && finish_time < start_time
  		errors.add(:finish_time, "结束时间不能早于开始时间")
  	end
  end
end
