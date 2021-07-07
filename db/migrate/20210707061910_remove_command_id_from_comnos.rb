class RemoveCommandIdFromComnos < ActiveRecord::Migration[5.2]
  def change
    remove_column :combos, :command_id, :integer
  end
end
