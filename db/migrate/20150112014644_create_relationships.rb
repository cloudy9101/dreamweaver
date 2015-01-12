class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
    	t.belongs_to :follower
    	t.belongs_to :following

      t.timestamps
    end
  end
end
