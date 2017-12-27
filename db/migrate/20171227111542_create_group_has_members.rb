class CreateGroupHasMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :group_has_members do |t|
      t.integer :member_id
      t.integer :group_id
      t.timestamps
    end
  end
end
