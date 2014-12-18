class AddGreatAndCategoryToTarget < ActiveRecord::Migration
  def change
  	add_column :targets, :great, :integer, default: 0
  	add_column :targets, :category, :integer, default: 0
  end
end
