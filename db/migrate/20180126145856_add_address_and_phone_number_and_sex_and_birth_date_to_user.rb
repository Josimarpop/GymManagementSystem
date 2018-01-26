class AddAddressAndPhoneNumberAndSexAndBirthDateToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :address, :string
    add_column :users, :phoneNumber, :string
    add_column :users, :sex, :string
    add_column :users, :birthDate, :date
  end
end
