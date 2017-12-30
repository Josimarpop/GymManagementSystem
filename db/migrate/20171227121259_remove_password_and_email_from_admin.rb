class RemovePasswordAndEmailFromAdmin < ActiveRecord::Migration[5.1]
  def change
    remove_column :admins, :password, :string
    remove_column :admins, :email, :string
  end
end
