class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :membership_id
      t.string :status
      t.date :membership_starts_at
      t.date :membership_ends_at
      t.date :membership_pause_at
      t.integer :membership_type_id
      t.timestamps
    end
  end
end
