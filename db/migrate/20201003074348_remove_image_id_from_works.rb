class RemoveImageIdFromWorks < ActiveRecord::Migration[5.2]
  def change
    remove_column :works, :image_id, :integer
  end
end
