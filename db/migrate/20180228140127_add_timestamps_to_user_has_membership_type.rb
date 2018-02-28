class AddTimestampsToUserHasMembershipType < ActiveRecord::Migration[5.1]
  def change
    add_column :user_has_membership_types, :created_at, :datetime
    add_column :user_has_membership_types, :updated_at, :datetime
  end
end
