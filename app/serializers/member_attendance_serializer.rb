class MemberAttendanceSerializer < ActiveModel::Serializer
  attributes :id, :code, :membership_id
end
