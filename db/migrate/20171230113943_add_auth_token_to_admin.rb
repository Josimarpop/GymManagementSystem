class AddAuthTokenToAdmin < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :auth_token, :string
  end
end
