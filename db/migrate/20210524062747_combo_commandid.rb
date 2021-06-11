class ComboCommandid < ActiveRecord::Migration[5.2]
  def change
    add_column :combos, :command_id, :integer
  end
end
