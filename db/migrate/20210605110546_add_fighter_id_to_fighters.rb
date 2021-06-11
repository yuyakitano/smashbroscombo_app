class AddFighterIdToFighters < ActiveRecord::Migration[5.2]
  def change
    add_column :fighters, :fighter_id, :integer
  end
end
