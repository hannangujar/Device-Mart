class AddImagePathToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :image_path, :string
  end
end
