class UserHasMembershipType < ApplicationRecord
  belongs_to :user
  belongs_to :membership_type
end
