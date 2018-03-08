class AddBonusAttendanceToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bonus_attendance, :datetime
  end
end
