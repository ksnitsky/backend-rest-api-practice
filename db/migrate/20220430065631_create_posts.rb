class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :rating, default: 0
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :tags

      t.timestamps
    end
  end
end
