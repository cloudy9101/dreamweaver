class AddCommentIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :root_id, :integer, default: 0
  end
end
