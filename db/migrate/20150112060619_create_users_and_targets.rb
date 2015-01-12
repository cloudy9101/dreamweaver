class CreateUsersAndTargets < ActiveRecord::Migration
  def change
    create_table :users_targets, id: false do |t|
    	t.belongs_to :user
    	t.belongs_to :target
    end
  end
end
