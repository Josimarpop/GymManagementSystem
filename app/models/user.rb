class User < ApplicationRecord
  has_one :membership_type
  has_many :member_attendances
  has_many :groups, :through => :group_has_members
end
