class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user
      t.references :target
      t.text :content

      t.timestamps
    end
  end
end
