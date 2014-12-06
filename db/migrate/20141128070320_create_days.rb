class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.date :date_at, index: true
      t.text :comment
      t.references :target, index: true

      t.timestamps
    end
  end
end
