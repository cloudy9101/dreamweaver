class RemoveCategoryFromTarget < ActiveRecord::Migration
  def change
  	remove_column :targets, :category
  end
end
