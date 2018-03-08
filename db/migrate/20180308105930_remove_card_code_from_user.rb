class RemoveCardCodeFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :card_code, :string
  end
end
