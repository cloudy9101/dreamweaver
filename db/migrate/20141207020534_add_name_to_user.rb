class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :birth, :date
    add_column :users, :introduce, :text
  end
end
