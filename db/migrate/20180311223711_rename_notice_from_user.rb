class RenameNoticeFromUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :notice, :description
  end
end
