class AddHitsToTarget < ActiveRecord::Migration
  def change
  	add_column :targets, :hits, :integer, default: 0
  end
end
