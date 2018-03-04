class MemberAttendance < ApplicationRecord
  include ActiveModel::Serialization
  
  belongs_to :user
  belongs_to :membership_type
end
