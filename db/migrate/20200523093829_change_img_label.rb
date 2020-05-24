class ChangeImgLabel < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :image, :string
    add_column :photos, :label, :integer
  end
end
