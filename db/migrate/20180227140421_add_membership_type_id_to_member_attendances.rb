class AddMembershipTypeIdToMemberAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :member_attendances, :membership_type_id, :integer
  end
end
