class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.integer :category_id
      t.string :comic_image_id
      t.string :title
      t.string :author
      t.string :publisher
      t.text :body

      t.timestamps
    end
  end
end
