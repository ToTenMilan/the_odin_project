class RemoveRememberTokenFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :remember_token, :string
  end
end
