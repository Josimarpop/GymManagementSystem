class RemoveMembershipTypeIdFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :membership_type_id, :integer
  end
end
