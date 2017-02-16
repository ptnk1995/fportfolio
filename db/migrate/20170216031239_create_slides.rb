class CreateSlides < ActiveRecord::Migration[5.0]
  def change
    create_table :slides do |t|
      t.string :name
      t.string :title_en
      t.string :title_vi
      t.text :caption_en
      t.text :caption_vi
      t.string :title_ja
      t.text :caption_ja
      t.string :image

      t.timestamps
    end
  end
end
