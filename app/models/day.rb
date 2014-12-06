class Day < ActiveRecord::Base
  belongs_to :target
  validates :date_at, :comment, :target_id, presence: true
end
