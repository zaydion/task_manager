class AddOriginToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :origin_id, :integer, null: false
    add_column :comments, :origin_type, :string, null: false
    add_index :comments, [:origin_type, :origin_id]
  end
end
