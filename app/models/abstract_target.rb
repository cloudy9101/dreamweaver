class AbstractTarget < ActiveRecord::Base
  include Timeago

  has_many :targets, dependent: :destroy
  accepts_nested_attributes_for :targets

  has_many :users, through: :targets

  belongs_to :category

  validates :name, :detail, :category_id, presence: true
  validates :name, :detail, uniqueness: true

  scope :great, -> { where(great: true) }
end
