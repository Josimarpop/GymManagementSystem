class CreateMemberAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :member_attendances do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
