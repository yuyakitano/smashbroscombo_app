class AddUserIdToCombos < ActiveRecord::Migration[5.2]
  def change
    add_column :combos, :user_id, :string
  end
end
