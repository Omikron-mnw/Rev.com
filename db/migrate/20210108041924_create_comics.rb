class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.integer :category_id
      t.integer :comic_image_id
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
