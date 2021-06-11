class RemoveNameFromFighters < ActiveRecord::Migration[5.2]
  def change
    remove_column :fighters, :name, :string
  end
end
