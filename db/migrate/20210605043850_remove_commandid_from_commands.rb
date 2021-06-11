class RemoveCommandidFromCommands < ActiveRecord::Migration[5.2]
  def change
    remove_column :commands, :commandid, :integer
  end
end
