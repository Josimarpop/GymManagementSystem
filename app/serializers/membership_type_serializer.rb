class MembershipTypeSerializer < ActiveModel::Serializer
  attributes :id, :name, :max_week_attendance_restriction, :after_hour_restriction
end
