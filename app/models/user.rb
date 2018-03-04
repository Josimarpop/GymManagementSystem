class User < ApplicationRecord
  has_one :membership_type
  has_many :member_attendances, :dependent => :delete_all
  has_many :group_has_users
  has_many :groups, :through => :group_has_users

  has_many :user_has_membership_types
  has_many :membership_types, :through => :user_has_membership_types

end
