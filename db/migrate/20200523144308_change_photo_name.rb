class ChangePhotoName < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :neme, :string
    add_column :photos, :name, :string
  end
end
