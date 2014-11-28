class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.string :name
      t.text :detail
      t.date :start_time
      t.date :finish_time
      t.references :user, index: true

      t.timestamps
    end
  end
end
