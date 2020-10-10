class CreatePostComments < ActiveRecord::Migration[5.2]
  def change
    create_table :post_comments do |t|
      t.text :comment
      t.integer :member_id
      t.integer :work_id

      t.timestamps
    end
  end
end
