class RenameProfileImageColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :profile_image, :profile_image_id
    change_column :users, :profile_image_id, :text 
  end
end
