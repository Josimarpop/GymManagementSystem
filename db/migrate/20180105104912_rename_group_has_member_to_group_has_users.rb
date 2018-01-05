class RenameGroupHasMemberToGroupHasUsers < ActiveRecord::Migration[5.1]
  def change
    rename_table :group_has_members, :group_has_users
  end
end
