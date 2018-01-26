class AddCardCodeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :card_code, :string
  end
end
