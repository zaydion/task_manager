class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :src
      t.string :caption
      t.text :description
      t.integer :imageable_id
      t.string :imageable_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
