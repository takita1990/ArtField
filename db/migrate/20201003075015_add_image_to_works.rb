class AddImageToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :image, :json
  end
end
