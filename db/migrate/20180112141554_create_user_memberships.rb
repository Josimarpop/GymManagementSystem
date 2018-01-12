class CreateUserMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :user_memberships do |t|
      t.integer :user_id
      t.integer :membership_type_id

      t.timestamps
    end
  end
end
