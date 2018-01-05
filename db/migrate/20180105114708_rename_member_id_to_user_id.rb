class RenameMemberIdToUserId < ActiveRecord::Migration[5.1]
  def change
    rename_column :group_has_users, :member_id, :user_id
  end
end
