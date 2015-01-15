class CreateAbstractTargets < ActiveRecord::Migration
  def change
    create_table :abstract_targets do |t|
      t.string :name
      t.text :detail
      t.integer :category_id

      t.timestamps
    end

    remove_column :targets, :name
    remove_column :targets, :detail
    remove_column :targets, :category_id
    add_column :targets, :abstract_target_id, :integer
  end
end
