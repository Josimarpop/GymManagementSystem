class MembershipType < ApplicationRecord
  has_many :user_has_membership_types
  has_many :users, :through => :user_has_membership_types
end
