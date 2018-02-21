class RenamePhoneNumberAndBirthDateInUser < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :phoneNumber, :phone_number
    rename_column :users, :birthDate, :birth_date
  end
end
