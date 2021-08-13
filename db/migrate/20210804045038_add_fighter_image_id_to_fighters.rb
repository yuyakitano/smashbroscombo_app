class AddFighterImageIdToFighters < ActiveRecord::Migration[5.2]
  def change
    add_column :fighters, :fighter_image_id, :string
  end
end
