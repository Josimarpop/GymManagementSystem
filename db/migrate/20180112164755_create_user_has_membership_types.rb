class CreateUserHasMembershipTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :user_has_membership_types do |t|
      t.integer :user_id
      t.integer :membership_type_id
    end
  end
end
