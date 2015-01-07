class AddCategoryidToTarget < ActiveRecord::Migration
  def change
  	add_column :targets, :category_id, :integer
  end
end
