class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :target_type
      t.string :image
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
