class User < ApplicationRecord
  has_one :membership_type
  has_many :member_attendances
  has_many :group_has_users
  has_many :groups, :through => :group_has_users
end
