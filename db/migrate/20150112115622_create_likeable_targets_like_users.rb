class CreateLikeableTargetsLikeUsers < ActiveRecord::Migration
  def change
    create_table :likeable_targets_like_users, id: false do |t|
    	t.belongs_to :user
    	t.belongs_to :target
    end
  end
end
