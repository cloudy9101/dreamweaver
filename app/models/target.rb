class Target < ActiveRecord::Base
  belongs_to :user
  validates :name, :detail, :start_time, :finish_time, presence: true
  validates :name, uniqueness: true
end
