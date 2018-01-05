class Group < ApplicationRecord
  has_many :group_has_users
  has_many :users, :through => :group_has_users
end
