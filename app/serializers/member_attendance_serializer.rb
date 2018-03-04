class MemberAttendanceSerializer < ActiveModel::Serializer
  attributes :id, :created_at
  attribute :user

  def user
    UserMemberAttendancesSerializer.new(object.user) unless object.user.blank?
  end
end
