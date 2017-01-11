class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :url
      t.string :description
      t.string :core_features
      t.text :realease_note
      t.string :git_repository
      t.string :server_information
      t.string :platform
      t.references :category, foreign_key: true
      t.string :private_attributes
      t.boolean :is_suggest

      t.timestamps
    end
  end
end
