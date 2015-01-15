class AbstractTarget < ActiveRecord::Base
  has_many :targets
  accepts_nested_attributes_for :targets

  has_many :users, through: :targets

  has_and_belongs_to_many :followed_users, class_name: "User", foreign_key: 'target_id', association_foreign_key: "user_id", join_table: 'users_targets'

  belongs_to :category

  validates :name, :detail, :category_id, presence: true
  validates :name, :detail, uniqueness: true
end
