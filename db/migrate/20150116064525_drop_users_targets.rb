class DropUsersTargets < ActiveRecord::Migration
  def change
    drop_table :users_targets
  end
end
