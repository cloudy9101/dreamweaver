class AddHitsAndGreatToAbstractTarget < ActiveRecord::Migration
  def change
    add_column :abstract_targets, :hits, :integer, default: 0
    add_column :abstract_targets, :great, :boolean, default: false
  end
end
