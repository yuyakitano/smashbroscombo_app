class AddNameToFighters < ActiveRecord::Migration[5.2]
  def change
    add_column :fighters, :name, :string
  end
end
