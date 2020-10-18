class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :work_id
      t.string :filename

      t.timestamps
    end
  end
end
