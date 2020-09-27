class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :genre_id, null: false
      t.integer :image_id, null: false
      t.integer :member_id, null: false

      t.timestamps
    end
  end
end
