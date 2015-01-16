class AbstractTarget < ActiveRecord::Base
  has_many :targets
  accepts_nested_attributes_for :targets

  has_many :users, through: :targets

  belongs_to :category

  validates :name, :detail, :category_id, presence: true
  validates :name, :detail, uniqueness: true
end
