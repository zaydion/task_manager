class IndexCommentableOnComment < ActiveRecord::Migration[7.0]
  def change
    add_index :comments, [:commentable_type, :commentable_id]
  end
end
