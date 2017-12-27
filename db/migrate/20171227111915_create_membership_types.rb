class CreateMembershipTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :membership_types do |t|
      t.string :name
      t.integer :max_week_attendance_restriction
      t.time :after_hour_restriction

      t.timestamps
    end
  end
end
