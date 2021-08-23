class ChangeUsernameColumnOnPost < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :username, false, 0
    change_column_default :users, :username, from: nil, to: ""
  end
end
